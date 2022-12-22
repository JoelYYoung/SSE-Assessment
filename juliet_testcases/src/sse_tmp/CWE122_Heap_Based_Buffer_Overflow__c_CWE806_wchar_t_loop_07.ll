; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_07.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_07.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticFive = internal global i32 5, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_07_bad() #0 !dbg !20 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !23, metadata !DIExpression()), !dbg !24
  %call = call noalias align 16 i8* @malloc(i64 400) #7, !dbg !25
  %0 = bitcast i8* %call to i32*, !dbg !26
  store i32* %0, i32** %data, align 8, !dbg !27
  %1 = load i32*, i32** %data, align 8, !dbg !28
  %cmp = icmp eq i32* %1, null, !dbg !30
  br i1 %cmp, label %if.then, label %if.end, !dbg !31

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !32
  unreachable, !dbg !32

if.end:                                           ; preds = %entry
  %2 = load i32, i32* @staticFive, align 4, !dbg !34
  %cmp1 = icmp eq i32 %2, 5, !dbg !36
  br i1 %cmp1, label %if.then2, label %if.end4, !dbg !37

if.then2:                                         ; preds = %if.end
  %3 = load i32*, i32** %data, align 8, !dbg !38
  %call3 = call i32* @wmemset(i32* %3, i32 65, i64 99) #7, !dbg !40
  %4 = load i32*, i32** %data, align 8, !dbg !41
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !41
  store i32 0, i32* %arrayidx, align 4, !dbg !42
  br label %if.end4, !dbg !43

if.end4:                                          ; preds = %if.then2, %if.end
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !44, metadata !DIExpression()), !dbg !49
  %5 = bitcast [50 x i32]* %dest to i8*, !dbg !49
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 200, i1 false), !dbg !49
  call void @llvm.dbg.declare(metadata i64* %i, metadata !50, metadata !DIExpression()), !dbg !53
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !54, metadata !DIExpression()), !dbg !55
  %6 = load i32*, i32** %data, align 8, !dbg !56
  %call5 = call i64 @wcslen(i32* %6) #9, !dbg !57
  store i64 %call5, i64* %dataLen, align 8, !dbg !58
  store i64 0, i64* %i, align 8, !dbg !59
  br label %for.cond, !dbg !61

for.cond:                                         ; preds = %for.inc, %if.end4
  %7 = load i64, i64* %i, align 8, !dbg !62
  %8 = load i64, i64* %dataLen, align 8, !dbg !64
  %cmp6 = icmp ult i64 %7, %8, !dbg !65
  br i1 %cmp6, label %for.body, label %for.end, !dbg !66

for.body:                                         ; preds = %for.cond
  %9 = load i32*, i32** %data, align 8, !dbg !67
  %10 = load i64, i64* %i, align 8, !dbg !69
  %arrayidx7 = getelementptr inbounds i32, i32* %9, i64 %10, !dbg !67
  %11 = load i32, i32* %arrayidx7, align 4, !dbg !67
  %12 = load i64, i64* %i, align 8, !dbg !70
  %arrayidx8 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %12, !dbg !71
  store i32 %11, i32* %arrayidx8, align 4, !dbg !72
  br label %for.inc, !dbg !73

for.inc:                                          ; preds = %for.body
  %13 = load i64, i64* %i, align 8, !dbg !74
  %inc = add i64 %13, 1, !dbg !74
  store i64 %inc, i64* %i, align 8, !dbg !74
  br label %for.cond, !dbg !75, !llvm.loop !76

for.end:                                          ; preds = %for.cond
  %arrayidx9 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !79
  store i32 0, i32* %arrayidx9, align 4, !dbg !80
  %14 = load i32*, i32** %data, align 8, !dbg !81
  call void @printWLine(i32* %14), !dbg !82
  %15 = load i32*, i32** %data, align 8, !dbg !83
  %16 = bitcast i32* %15 to i8*, !dbg !83
  call void @free(i8* %16) #7, !dbg !84
  ret void, !dbg !85
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #5

declare dso_local void @printWLine(i32*) #6

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_07_good() #0 !dbg !86 {
entry:
  call void @goodG2B1(), !dbg !87
  call void @goodG2B2(), !dbg !88
  ret void, !dbg !89
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !90 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !96, metadata !DIExpression()), !dbg !97
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !98, metadata !DIExpression()), !dbg !99
  %call = call i64 @time(i64* null) #7, !dbg !100
  %conv = trunc i64 %call to i32, !dbg !101
  call void @srand(i32 %conv) #7, !dbg !102
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !103
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_07_good(), !dbg !104
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !105
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !106
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_07_bad(), !dbg !107
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !108
  ret i32 0, !dbg !109
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #6

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !110 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !111, metadata !DIExpression()), !dbg !112
  %call = call noalias align 16 i8* @malloc(i64 400) #7, !dbg !113
  %0 = bitcast i8* %call to i32*, !dbg !114
  store i32* %0, i32** %data, align 8, !dbg !115
  %1 = load i32*, i32** %data, align 8, !dbg !116
  %cmp = icmp eq i32* %1, null, !dbg !118
  br i1 %cmp, label %if.then, label %if.end, !dbg !119

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !120
  unreachable, !dbg !120

if.end:                                           ; preds = %entry
  %2 = load i32, i32* @staticFive, align 4, !dbg !122
  %cmp1 = icmp ne i32 %2, 5, !dbg !124
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !125

if.then2:                                         ; preds = %if.end
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !126
  br label %if.end4, !dbg !128

if.else:                                          ; preds = %if.end
  %3 = load i32*, i32** %data, align 8, !dbg !129
  %call3 = call i32* @wmemset(i32* %3, i32 65, i64 49) #7, !dbg !131
  %4 = load i32*, i32** %data, align 8, !dbg !132
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 49, !dbg !132
  store i32 0, i32* %arrayidx, align 4, !dbg !133
  br label %if.end4

if.end4:                                          ; preds = %if.else, %if.then2
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !134, metadata !DIExpression()), !dbg !136
  %5 = bitcast [50 x i32]* %dest to i8*, !dbg !136
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 200, i1 false), !dbg !136
  call void @llvm.dbg.declare(metadata i64* %i, metadata !137, metadata !DIExpression()), !dbg !138
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !139, metadata !DIExpression()), !dbg !140
  %6 = load i32*, i32** %data, align 8, !dbg !141
  %call5 = call i64 @wcslen(i32* %6) #9, !dbg !142
  store i64 %call5, i64* %dataLen, align 8, !dbg !143
  store i64 0, i64* %i, align 8, !dbg !144
  br label %for.cond, !dbg !146

for.cond:                                         ; preds = %for.inc, %if.end4
  %7 = load i64, i64* %i, align 8, !dbg !147
  %8 = load i64, i64* %dataLen, align 8, !dbg !149
  %cmp6 = icmp ult i64 %7, %8, !dbg !150
  br i1 %cmp6, label %for.body, label %for.end, !dbg !151

for.body:                                         ; preds = %for.cond
  %9 = load i32*, i32** %data, align 8, !dbg !152
  %10 = load i64, i64* %i, align 8, !dbg !154
  %arrayidx7 = getelementptr inbounds i32, i32* %9, i64 %10, !dbg !152
  %11 = load i32, i32* %arrayidx7, align 4, !dbg !152
  %12 = load i64, i64* %i, align 8, !dbg !155
  %arrayidx8 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %12, !dbg !156
  store i32 %11, i32* %arrayidx8, align 4, !dbg !157
  br label %for.inc, !dbg !158

for.inc:                                          ; preds = %for.body
  %13 = load i64, i64* %i, align 8, !dbg !159
  %inc = add i64 %13, 1, !dbg !159
  store i64 %inc, i64* %i, align 8, !dbg !159
  br label %for.cond, !dbg !160, !llvm.loop !161

for.end:                                          ; preds = %for.cond
  %arrayidx9 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !163
  store i32 0, i32* %arrayidx9, align 4, !dbg !164
  %14 = load i32*, i32** %data, align 8, !dbg !165
  call void @printWLine(i32* %14), !dbg !166
  %15 = load i32*, i32** %data, align 8, !dbg !167
  %16 = bitcast i32* %15 to i8*, !dbg !167
  call void @free(i8* %16) #7, !dbg !168
  ret void, !dbg !169
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !170 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !171, metadata !DIExpression()), !dbg !172
  %call = call noalias align 16 i8* @malloc(i64 400) #7, !dbg !173
  %0 = bitcast i8* %call to i32*, !dbg !174
  store i32* %0, i32** %data, align 8, !dbg !175
  %1 = load i32*, i32** %data, align 8, !dbg !176
  %cmp = icmp eq i32* %1, null, !dbg !178
  br i1 %cmp, label %if.then, label %if.end, !dbg !179

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !180
  unreachable, !dbg !180

if.end:                                           ; preds = %entry
  %2 = load i32, i32* @staticFive, align 4, !dbg !182
  %cmp1 = icmp eq i32 %2, 5, !dbg !184
  br i1 %cmp1, label %if.then2, label %if.end4, !dbg !185

if.then2:                                         ; preds = %if.end
  %3 = load i32*, i32** %data, align 8, !dbg !186
  %call3 = call i32* @wmemset(i32* %3, i32 65, i64 49) #7, !dbg !188
  %4 = load i32*, i32** %data, align 8, !dbg !189
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 49, !dbg !189
  store i32 0, i32* %arrayidx, align 4, !dbg !190
  br label %if.end4, !dbg !191

if.end4:                                          ; preds = %if.then2, %if.end
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !192, metadata !DIExpression()), !dbg !194
  %5 = bitcast [50 x i32]* %dest to i8*, !dbg !194
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 200, i1 false), !dbg !194
  call void @llvm.dbg.declare(metadata i64* %i, metadata !195, metadata !DIExpression()), !dbg !196
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !197, metadata !DIExpression()), !dbg !198
  %6 = load i32*, i32** %data, align 8, !dbg !199
  %call5 = call i64 @wcslen(i32* %6) #9, !dbg !200
  store i64 %call5, i64* %dataLen, align 8, !dbg !201
  store i64 0, i64* %i, align 8, !dbg !202
  br label %for.cond, !dbg !204

for.cond:                                         ; preds = %for.inc, %if.end4
  %7 = load i64, i64* %i, align 8, !dbg !205
  %8 = load i64, i64* %dataLen, align 8, !dbg !207
  %cmp6 = icmp ult i64 %7, %8, !dbg !208
  br i1 %cmp6, label %for.body, label %for.end, !dbg !209

for.body:                                         ; preds = %for.cond
  %9 = load i32*, i32** %data, align 8, !dbg !210
  %10 = load i64, i64* %i, align 8, !dbg !212
  %arrayidx7 = getelementptr inbounds i32, i32* %9, i64 %10, !dbg !210
  %11 = load i32, i32* %arrayidx7, align 4, !dbg !210
  %12 = load i64, i64* %i, align 8, !dbg !213
  %arrayidx8 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %12, !dbg !214
  store i32 %11, i32* %arrayidx8, align 4, !dbg !215
  br label %for.inc, !dbg !216

for.inc:                                          ; preds = %for.body
  %13 = load i64, i64* %i, align 8, !dbg !217
  %inc = add i64 %13, 1, !dbg !217
  store i64 %inc, i64* %i, align 8, !dbg !217
  br label %for.cond, !dbg !218, !llvm.loop !219

for.end:                                          ; preds = %for.cond
  %arrayidx9 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !221
  store i32 0, i32* %arrayidx9, align 4, !dbg !222
  %14 = load i32*, i32** %data, align 8, !dbg !223
  call void @printWLine(i32* %14), !dbg !224
  %15 = load i32*, i32** %data, align 8, !dbg !225
  %16 = bitcast i32* %15 to i8*, !dbg !225
  call void @free(i8* %16) #7, !dbg !226
  ret void, !dbg !227
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }
attributes #9 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!14, !15, !16, !17, !18}
!llvm.ident = !{!19}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticFive", scope: !2, file: !13, line: 25, type: !9, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !12, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_07.c", directory: "/root/SSE-Assessment")
!4 = !{}
!5 = !{!6, !10, !11}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !8, line: 74, baseType: !9)
!8 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!11 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!12 = !{!0}
!13 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_07.c", directory: "/root/SSE-Assessment")
!14 = !{i32 7, !"Dwarf Version", i32 4}
!15 = !{i32 2, !"Debug Info Version", i32 3}
!16 = !{i32 1, !"wchar_size", i32 4}
!17 = !{i32 7, !"uwtable", i32 1}
!18 = !{i32 7, !"frame-pointer", i32 2}
!19 = !{!"clang version 13.0.0"}
!20 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_07_bad", scope: !13, file: !13, line: 29, type: !21, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !DILocalVariable(name: "data", scope: !20, file: !13, line: 31, type: !6)
!24 = !DILocation(line: 31, column: 15, scope: !20)
!25 = !DILocation(line: 32, column: 23, scope: !20)
!26 = !DILocation(line: 32, column: 12, scope: !20)
!27 = !DILocation(line: 32, column: 10, scope: !20)
!28 = !DILocation(line: 33, column: 9, scope: !29)
!29 = distinct !DILexicalBlock(scope: !20, file: !13, line: 33, column: 9)
!30 = !DILocation(line: 33, column: 14, scope: !29)
!31 = !DILocation(line: 33, column: 9, scope: !20)
!32 = !DILocation(line: 33, column: 24, scope: !33)
!33 = distinct !DILexicalBlock(scope: !29, file: !13, line: 33, column: 23)
!34 = !DILocation(line: 34, column: 8, scope: !35)
!35 = distinct !DILexicalBlock(scope: !20, file: !13, line: 34, column: 8)
!36 = !DILocation(line: 34, column: 18, scope: !35)
!37 = !DILocation(line: 34, column: 8, scope: !20)
!38 = !DILocation(line: 37, column: 17, scope: !39)
!39 = distinct !DILexicalBlock(scope: !35, file: !13, line: 35, column: 5)
!40 = !DILocation(line: 37, column: 9, scope: !39)
!41 = !DILocation(line: 38, column: 9, scope: !39)
!42 = !DILocation(line: 38, column: 21, scope: !39)
!43 = !DILocation(line: 39, column: 5, scope: !39)
!44 = !DILocalVariable(name: "dest", scope: !45, file: !13, line: 41, type: !46)
!45 = distinct !DILexicalBlock(scope: !20, file: !13, line: 40, column: 5)
!46 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 1600, elements: !47)
!47 = !{!48}
!48 = !DISubrange(count: 50)
!49 = !DILocation(line: 41, column: 17, scope: !45)
!50 = !DILocalVariable(name: "i", scope: !45, file: !13, line: 42, type: !51)
!51 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !8, line: 46, baseType: !52)
!52 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!53 = !DILocation(line: 42, column: 16, scope: !45)
!54 = !DILocalVariable(name: "dataLen", scope: !45, file: !13, line: 42, type: !51)
!55 = !DILocation(line: 42, column: 19, scope: !45)
!56 = !DILocation(line: 43, column: 26, scope: !45)
!57 = !DILocation(line: 43, column: 19, scope: !45)
!58 = !DILocation(line: 43, column: 17, scope: !45)
!59 = !DILocation(line: 45, column: 16, scope: !60)
!60 = distinct !DILexicalBlock(scope: !45, file: !13, line: 45, column: 9)
!61 = !DILocation(line: 45, column: 14, scope: !60)
!62 = !DILocation(line: 45, column: 21, scope: !63)
!63 = distinct !DILexicalBlock(scope: !60, file: !13, line: 45, column: 9)
!64 = !DILocation(line: 45, column: 25, scope: !63)
!65 = !DILocation(line: 45, column: 23, scope: !63)
!66 = !DILocation(line: 45, column: 9, scope: !60)
!67 = !DILocation(line: 47, column: 23, scope: !68)
!68 = distinct !DILexicalBlock(scope: !63, file: !13, line: 46, column: 9)
!69 = !DILocation(line: 47, column: 28, scope: !68)
!70 = !DILocation(line: 47, column: 18, scope: !68)
!71 = !DILocation(line: 47, column: 13, scope: !68)
!72 = !DILocation(line: 47, column: 21, scope: !68)
!73 = !DILocation(line: 48, column: 9, scope: !68)
!74 = !DILocation(line: 45, column: 35, scope: !63)
!75 = !DILocation(line: 45, column: 9, scope: !63)
!76 = distinct !{!76, !66, !77, !78}
!77 = !DILocation(line: 48, column: 9, scope: !60)
!78 = !{!"llvm.loop.mustprogress"}
!79 = !DILocation(line: 49, column: 9, scope: !45)
!80 = !DILocation(line: 49, column: 20, scope: !45)
!81 = !DILocation(line: 50, column: 20, scope: !45)
!82 = !DILocation(line: 50, column: 9, scope: !45)
!83 = !DILocation(line: 51, column: 14, scope: !45)
!84 = !DILocation(line: 51, column: 9, scope: !45)
!85 = !DILocation(line: 53, column: 1, scope: !20)
!86 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_07_good", scope: !13, file: !13, line: 118, type: !21, scopeLine: 119, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!87 = !DILocation(line: 120, column: 5, scope: !86)
!88 = !DILocation(line: 121, column: 5, scope: !86)
!89 = !DILocation(line: 122, column: 1, scope: !86)
!90 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 134, type: !91, scopeLine: 135, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!91 = !DISubroutineType(types: !92)
!92 = !{!9, !9, !93}
!93 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !94, size: 64)
!94 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !95, size: 64)
!95 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!96 = !DILocalVariable(name: "argc", arg: 1, scope: !90, file: !13, line: 134, type: !9)
!97 = !DILocation(line: 134, column: 14, scope: !90)
!98 = !DILocalVariable(name: "argv", arg: 2, scope: !90, file: !13, line: 134, type: !93)
!99 = !DILocation(line: 134, column: 27, scope: !90)
!100 = !DILocation(line: 137, column: 22, scope: !90)
!101 = !DILocation(line: 137, column: 12, scope: !90)
!102 = !DILocation(line: 137, column: 5, scope: !90)
!103 = !DILocation(line: 139, column: 5, scope: !90)
!104 = !DILocation(line: 140, column: 5, scope: !90)
!105 = !DILocation(line: 141, column: 5, scope: !90)
!106 = !DILocation(line: 144, column: 5, scope: !90)
!107 = !DILocation(line: 145, column: 5, scope: !90)
!108 = !DILocation(line: 146, column: 5, scope: !90)
!109 = !DILocation(line: 148, column: 5, scope: !90)
!110 = distinct !DISubprogram(name: "goodG2B1", scope: !13, file: !13, line: 60, type: !21, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!111 = !DILocalVariable(name: "data", scope: !110, file: !13, line: 62, type: !6)
!112 = !DILocation(line: 62, column: 15, scope: !110)
!113 = !DILocation(line: 63, column: 23, scope: !110)
!114 = !DILocation(line: 63, column: 12, scope: !110)
!115 = !DILocation(line: 63, column: 10, scope: !110)
!116 = !DILocation(line: 64, column: 9, scope: !117)
!117 = distinct !DILexicalBlock(scope: !110, file: !13, line: 64, column: 9)
!118 = !DILocation(line: 64, column: 14, scope: !117)
!119 = !DILocation(line: 64, column: 9, scope: !110)
!120 = !DILocation(line: 64, column: 24, scope: !121)
!121 = distinct !DILexicalBlock(scope: !117, file: !13, line: 64, column: 23)
!122 = !DILocation(line: 65, column: 8, scope: !123)
!123 = distinct !DILexicalBlock(scope: !110, file: !13, line: 65, column: 8)
!124 = !DILocation(line: 65, column: 18, scope: !123)
!125 = !DILocation(line: 65, column: 8, scope: !110)
!126 = !DILocation(line: 68, column: 9, scope: !127)
!127 = distinct !DILexicalBlock(scope: !123, file: !13, line: 66, column: 5)
!128 = !DILocation(line: 69, column: 5, scope: !127)
!129 = !DILocation(line: 73, column: 17, scope: !130)
!130 = distinct !DILexicalBlock(scope: !123, file: !13, line: 71, column: 5)
!131 = !DILocation(line: 73, column: 9, scope: !130)
!132 = !DILocation(line: 74, column: 9, scope: !130)
!133 = !DILocation(line: 74, column: 20, scope: !130)
!134 = !DILocalVariable(name: "dest", scope: !135, file: !13, line: 77, type: !46)
!135 = distinct !DILexicalBlock(scope: !110, file: !13, line: 76, column: 5)
!136 = !DILocation(line: 77, column: 17, scope: !135)
!137 = !DILocalVariable(name: "i", scope: !135, file: !13, line: 78, type: !51)
!138 = !DILocation(line: 78, column: 16, scope: !135)
!139 = !DILocalVariable(name: "dataLen", scope: !135, file: !13, line: 78, type: !51)
!140 = !DILocation(line: 78, column: 19, scope: !135)
!141 = !DILocation(line: 79, column: 26, scope: !135)
!142 = !DILocation(line: 79, column: 19, scope: !135)
!143 = !DILocation(line: 79, column: 17, scope: !135)
!144 = !DILocation(line: 81, column: 16, scope: !145)
!145 = distinct !DILexicalBlock(scope: !135, file: !13, line: 81, column: 9)
!146 = !DILocation(line: 81, column: 14, scope: !145)
!147 = !DILocation(line: 81, column: 21, scope: !148)
!148 = distinct !DILexicalBlock(scope: !145, file: !13, line: 81, column: 9)
!149 = !DILocation(line: 81, column: 25, scope: !148)
!150 = !DILocation(line: 81, column: 23, scope: !148)
!151 = !DILocation(line: 81, column: 9, scope: !145)
!152 = !DILocation(line: 83, column: 23, scope: !153)
!153 = distinct !DILexicalBlock(scope: !148, file: !13, line: 82, column: 9)
!154 = !DILocation(line: 83, column: 28, scope: !153)
!155 = !DILocation(line: 83, column: 18, scope: !153)
!156 = !DILocation(line: 83, column: 13, scope: !153)
!157 = !DILocation(line: 83, column: 21, scope: !153)
!158 = !DILocation(line: 84, column: 9, scope: !153)
!159 = !DILocation(line: 81, column: 35, scope: !148)
!160 = !DILocation(line: 81, column: 9, scope: !148)
!161 = distinct !{!161, !151, !162, !78}
!162 = !DILocation(line: 84, column: 9, scope: !145)
!163 = !DILocation(line: 85, column: 9, scope: !135)
!164 = !DILocation(line: 85, column: 20, scope: !135)
!165 = !DILocation(line: 86, column: 20, scope: !135)
!166 = !DILocation(line: 86, column: 9, scope: !135)
!167 = !DILocation(line: 87, column: 14, scope: !135)
!168 = !DILocation(line: 87, column: 9, scope: !135)
!169 = !DILocation(line: 89, column: 1, scope: !110)
!170 = distinct !DISubprogram(name: "goodG2B2", scope: !13, file: !13, line: 92, type: !21, scopeLine: 93, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!171 = !DILocalVariable(name: "data", scope: !170, file: !13, line: 94, type: !6)
!172 = !DILocation(line: 94, column: 15, scope: !170)
!173 = !DILocation(line: 95, column: 23, scope: !170)
!174 = !DILocation(line: 95, column: 12, scope: !170)
!175 = !DILocation(line: 95, column: 10, scope: !170)
!176 = !DILocation(line: 96, column: 9, scope: !177)
!177 = distinct !DILexicalBlock(scope: !170, file: !13, line: 96, column: 9)
!178 = !DILocation(line: 96, column: 14, scope: !177)
!179 = !DILocation(line: 96, column: 9, scope: !170)
!180 = !DILocation(line: 96, column: 24, scope: !181)
!181 = distinct !DILexicalBlock(scope: !177, file: !13, line: 96, column: 23)
!182 = !DILocation(line: 97, column: 8, scope: !183)
!183 = distinct !DILexicalBlock(scope: !170, file: !13, line: 97, column: 8)
!184 = !DILocation(line: 97, column: 18, scope: !183)
!185 = !DILocation(line: 97, column: 8, scope: !170)
!186 = !DILocation(line: 100, column: 17, scope: !187)
!187 = distinct !DILexicalBlock(scope: !183, file: !13, line: 98, column: 5)
!188 = !DILocation(line: 100, column: 9, scope: !187)
!189 = !DILocation(line: 101, column: 9, scope: !187)
!190 = !DILocation(line: 101, column: 20, scope: !187)
!191 = !DILocation(line: 102, column: 5, scope: !187)
!192 = !DILocalVariable(name: "dest", scope: !193, file: !13, line: 104, type: !46)
!193 = distinct !DILexicalBlock(scope: !170, file: !13, line: 103, column: 5)
!194 = !DILocation(line: 104, column: 17, scope: !193)
!195 = !DILocalVariable(name: "i", scope: !193, file: !13, line: 105, type: !51)
!196 = !DILocation(line: 105, column: 16, scope: !193)
!197 = !DILocalVariable(name: "dataLen", scope: !193, file: !13, line: 105, type: !51)
!198 = !DILocation(line: 105, column: 19, scope: !193)
!199 = !DILocation(line: 106, column: 26, scope: !193)
!200 = !DILocation(line: 106, column: 19, scope: !193)
!201 = !DILocation(line: 106, column: 17, scope: !193)
!202 = !DILocation(line: 108, column: 16, scope: !203)
!203 = distinct !DILexicalBlock(scope: !193, file: !13, line: 108, column: 9)
!204 = !DILocation(line: 108, column: 14, scope: !203)
!205 = !DILocation(line: 108, column: 21, scope: !206)
!206 = distinct !DILexicalBlock(scope: !203, file: !13, line: 108, column: 9)
!207 = !DILocation(line: 108, column: 25, scope: !206)
!208 = !DILocation(line: 108, column: 23, scope: !206)
!209 = !DILocation(line: 108, column: 9, scope: !203)
!210 = !DILocation(line: 110, column: 23, scope: !211)
!211 = distinct !DILexicalBlock(scope: !206, file: !13, line: 109, column: 9)
!212 = !DILocation(line: 110, column: 28, scope: !211)
!213 = !DILocation(line: 110, column: 18, scope: !211)
!214 = !DILocation(line: 110, column: 13, scope: !211)
!215 = !DILocation(line: 110, column: 21, scope: !211)
!216 = !DILocation(line: 111, column: 9, scope: !211)
!217 = !DILocation(line: 108, column: 35, scope: !206)
!218 = !DILocation(line: 108, column: 9, scope: !206)
!219 = distinct !{!219, !209, !220, !78}
!220 = !DILocation(line: 111, column: 9, scope: !203)
!221 = !DILocation(line: 112, column: 9, scope: !193)
!222 = !DILocation(line: 112, column: 20, scope: !193)
!223 = !DILocation(line: 113, column: 20, scope: !193)
!224 = !DILocation(line: 113, column: 9, scope: !193)
!225 = !DILocation(line: 114, column: 14, scope: !193)
!226 = !DILocation(line: 114, column: 9, scope: !193)
!227 = !DILocation(line: 116, column: 1, scope: !170)
