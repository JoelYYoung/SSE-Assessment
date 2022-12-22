; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_13.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_13.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@GLOBAL_CONST_FIVE = external dso_local constant i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_13_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  %call = call noalias align 16 i8* @malloc(i64 400) #7, !dbg !22
  %0 = bitcast i8* %call to i32*, !dbg !23
  store i32* %0, i32** %data, align 8, !dbg !24
  %1 = load i32*, i32** %data, align 8, !dbg !25
  %cmp = icmp eq i32* %1, null, !dbg !27
  br i1 %cmp, label %if.then, label %if.end, !dbg !28

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !29
  unreachable, !dbg !29

if.end:                                           ; preds = %entry
  %2 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !31
  %cmp1 = icmp eq i32 %2, 5, !dbg !33
  br i1 %cmp1, label %if.then2, label %if.end4, !dbg !34

if.then2:                                         ; preds = %if.end
  %3 = load i32*, i32** %data, align 8, !dbg !35
  %call3 = call i32* @wmemset(i32* %3, i32 65, i64 99) #7, !dbg !37
  %4 = load i32*, i32** %data, align 8, !dbg !38
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !38
  store i32 0, i32* %arrayidx, align 4, !dbg !39
  br label %if.end4, !dbg !40

if.end4:                                          ; preds = %if.then2, %if.end
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !41, metadata !DIExpression()), !dbg !46
  %5 = bitcast [50 x i32]* %dest to i8*, !dbg !46
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 200, i1 false), !dbg !46
  call void @llvm.dbg.declare(metadata i64* %i, metadata !47, metadata !DIExpression()), !dbg !50
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !51, metadata !DIExpression()), !dbg !52
  %6 = load i32*, i32** %data, align 8, !dbg !53
  %call5 = call i64 @wcslen(i32* %6) #9, !dbg !54
  store i64 %call5, i64* %dataLen, align 8, !dbg !55
  store i64 0, i64* %i, align 8, !dbg !56
  br label %for.cond, !dbg !58

for.cond:                                         ; preds = %for.inc, %if.end4
  %7 = load i64, i64* %i, align 8, !dbg !59
  %8 = load i64, i64* %dataLen, align 8, !dbg !61
  %cmp6 = icmp ult i64 %7, %8, !dbg !62
  br i1 %cmp6, label %for.body, label %for.end, !dbg !63

for.body:                                         ; preds = %for.cond
  %9 = load i32*, i32** %data, align 8, !dbg !64
  %10 = load i64, i64* %i, align 8, !dbg !66
  %arrayidx7 = getelementptr inbounds i32, i32* %9, i64 %10, !dbg !64
  %11 = load i32, i32* %arrayidx7, align 4, !dbg !64
  %12 = load i64, i64* %i, align 8, !dbg !67
  %arrayidx8 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %12, !dbg !68
  store i32 %11, i32* %arrayidx8, align 4, !dbg !69
  br label %for.inc, !dbg !70

for.inc:                                          ; preds = %for.body
  %13 = load i64, i64* %i, align 8, !dbg !71
  %inc = add i64 %13, 1, !dbg !71
  store i64 %inc, i64* %i, align 8, !dbg !71
  br label %for.cond, !dbg !72, !llvm.loop !73

for.end:                                          ; preds = %for.cond
  %arrayidx9 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !76
  store i32 0, i32* %arrayidx9, align 4, !dbg !77
  %14 = load i32*, i32** %data, align 8, !dbg !78
  call void @printWLine(i32* %14), !dbg !79
  %15 = load i32*, i32** %data, align 8, !dbg !80
  %16 = bitcast i32* %15 to i8*, !dbg !80
  call void @free(i8* %16) #7, !dbg !81
  ret void, !dbg !82
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_13_good() #0 !dbg !83 {
entry:
  call void @goodG2B1(), !dbg !84
  call void @goodG2B2(), !dbg !85
  ret void, !dbg !86
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !87 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !93, metadata !DIExpression()), !dbg !94
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !95, metadata !DIExpression()), !dbg !96
  %call = call i64 @time(i64* null) #7, !dbg !97
  %conv = trunc i64 %call to i32, !dbg !98
  call void @srand(i32 %conv) #7, !dbg !99
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !100
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_13_good(), !dbg !101
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !102
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !103
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_13_bad(), !dbg !104
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !105
  ret i32 0, !dbg !106
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #6

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !107 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !108, metadata !DIExpression()), !dbg !109
  %call = call noalias align 16 i8* @malloc(i64 400) #7, !dbg !110
  %0 = bitcast i8* %call to i32*, !dbg !111
  store i32* %0, i32** %data, align 8, !dbg !112
  %1 = load i32*, i32** %data, align 8, !dbg !113
  %cmp = icmp eq i32* %1, null, !dbg !115
  br i1 %cmp, label %if.then, label %if.end, !dbg !116

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !117
  unreachable, !dbg !117

if.end:                                           ; preds = %entry
  %2 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !119
  %cmp1 = icmp ne i32 %2, 5, !dbg !121
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !122

if.then2:                                         ; preds = %if.end
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !123
  br label %if.end4, !dbg !125

if.else:                                          ; preds = %if.end
  %3 = load i32*, i32** %data, align 8, !dbg !126
  %call3 = call i32* @wmemset(i32* %3, i32 65, i64 49) #7, !dbg !128
  %4 = load i32*, i32** %data, align 8, !dbg !129
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 49, !dbg !129
  store i32 0, i32* %arrayidx, align 4, !dbg !130
  br label %if.end4

if.end4:                                          ; preds = %if.else, %if.then2
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !131, metadata !DIExpression()), !dbg !133
  %5 = bitcast [50 x i32]* %dest to i8*, !dbg !133
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 200, i1 false), !dbg !133
  call void @llvm.dbg.declare(metadata i64* %i, metadata !134, metadata !DIExpression()), !dbg !135
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !136, metadata !DIExpression()), !dbg !137
  %6 = load i32*, i32** %data, align 8, !dbg !138
  %call5 = call i64 @wcslen(i32* %6) #9, !dbg !139
  store i64 %call5, i64* %dataLen, align 8, !dbg !140
  store i64 0, i64* %i, align 8, !dbg !141
  br label %for.cond, !dbg !143

for.cond:                                         ; preds = %for.inc, %if.end4
  %7 = load i64, i64* %i, align 8, !dbg !144
  %8 = load i64, i64* %dataLen, align 8, !dbg !146
  %cmp6 = icmp ult i64 %7, %8, !dbg !147
  br i1 %cmp6, label %for.body, label %for.end, !dbg !148

for.body:                                         ; preds = %for.cond
  %9 = load i32*, i32** %data, align 8, !dbg !149
  %10 = load i64, i64* %i, align 8, !dbg !151
  %arrayidx7 = getelementptr inbounds i32, i32* %9, i64 %10, !dbg !149
  %11 = load i32, i32* %arrayidx7, align 4, !dbg !149
  %12 = load i64, i64* %i, align 8, !dbg !152
  %arrayidx8 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %12, !dbg !153
  store i32 %11, i32* %arrayidx8, align 4, !dbg !154
  br label %for.inc, !dbg !155

for.inc:                                          ; preds = %for.body
  %13 = load i64, i64* %i, align 8, !dbg !156
  %inc = add i64 %13, 1, !dbg !156
  store i64 %inc, i64* %i, align 8, !dbg !156
  br label %for.cond, !dbg !157, !llvm.loop !158

for.end:                                          ; preds = %for.cond
  %arrayidx9 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !160
  store i32 0, i32* %arrayidx9, align 4, !dbg !161
  %14 = load i32*, i32** %data, align 8, !dbg !162
  call void @printWLine(i32* %14), !dbg !163
  %15 = load i32*, i32** %data, align 8, !dbg !164
  %16 = bitcast i32* %15 to i8*, !dbg !164
  call void @free(i8* %16) #7, !dbg !165
  ret void, !dbg !166
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !167 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !168, metadata !DIExpression()), !dbg !169
  %call = call noalias align 16 i8* @malloc(i64 400) #7, !dbg !170
  %0 = bitcast i8* %call to i32*, !dbg !171
  store i32* %0, i32** %data, align 8, !dbg !172
  %1 = load i32*, i32** %data, align 8, !dbg !173
  %cmp = icmp eq i32* %1, null, !dbg !175
  br i1 %cmp, label %if.then, label %if.end, !dbg !176

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !177
  unreachable, !dbg !177

if.end:                                           ; preds = %entry
  %2 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !179
  %cmp1 = icmp eq i32 %2, 5, !dbg !181
  br i1 %cmp1, label %if.then2, label %if.end4, !dbg !182

if.then2:                                         ; preds = %if.end
  %3 = load i32*, i32** %data, align 8, !dbg !183
  %call3 = call i32* @wmemset(i32* %3, i32 65, i64 49) #7, !dbg !185
  %4 = load i32*, i32** %data, align 8, !dbg !186
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 49, !dbg !186
  store i32 0, i32* %arrayidx, align 4, !dbg !187
  br label %if.end4, !dbg !188

if.end4:                                          ; preds = %if.then2, %if.end
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !189, metadata !DIExpression()), !dbg !191
  %5 = bitcast [50 x i32]* %dest to i8*, !dbg !191
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 200, i1 false), !dbg !191
  call void @llvm.dbg.declare(metadata i64* %i, metadata !192, metadata !DIExpression()), !dbg !193
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !194, metadata !DIExpression()), !dbg !195
  %6 = load i32*, i32** %data, align 8, !dbg !196
  %call5 = call i64 @wcslen(i32* %6) #9, !dbg !197
  store i64 %call5, i64* %dataLen, align 8, !dbg !198
  store i64 0, i64* %i, align 8, !dbg !199
  br label %for.cond, !dbg !201

for.cond:                                         ; preds = %for.inc, %if.end4
  %7 = load i64, i64* %i, align 8, !dbg !202
  %8 = load i64, i64* %dataLen, align 8, !dbg !204
  %cmp6 = icmp ult i64 %7, %8, !dbg !205
  br i1 %cmp6, label %for.body, label %for.end, !dbg !206

for.body:                                         ; preds = %for.cond
  %9 = load i32*, i32** %data, align 8, !dbg !207
  %10 = load i64, i64* %i, align 8, !dbg !209
  %arrayidx7 = getelementptr inbounds i32, i32* %9, i64 %10, !dbg !207
  %11 = load i32, i32* %arrayidx7, align 4, !dbg !207
  %12 = load i64, i64* %i, align 8, !dbg !210
  %arrayidx8 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %12, !dbg !211
  store i32 %11, i32* %arrayidx8, align 4, !dbg !212
  br label %for.inc, !dbg !213

for.inc:                                          ; preds = %for.body
  %13 = load i64, i64* %i, align 8, !dbg !214
  %inc = add i64 %13, 1, !dbg !214
  store i64 %inc, i64* %i, align 8, !dbg !214
  br label %for.cond, !dbg !215, !llvm.loop !216

for.end:                                          ; preds = %for.cond
  %arrayidx9 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !218
  store i32 0, i32* %arrayidx9, align 4, !dbg !219
  %14 = load i32*, i32** %data, align 8, !dbg !220
  call void @printWLine(i32* %14), !dbg !221
  %15 = load i32*, i32** %data, align 8, !dbg !222
  %16 = bitcast i32* %15 to i8*, !dbg !222
  call void @free(i8* %16) #7, !dbg !223
  ret void, !dbg !224
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

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_13.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !8, !9}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !6, line: 74, baseType: !7)
!6 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!9 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!10 = !{i32 7, !"Dwarf Version", i32 4}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{i32 7, !"uwtable", i32 1}
!14 = !{i32 7, !"frame-pointer", i32 2}
!15 = !{!"clang version 13.0.0"}
!16 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_13_bad", scope: !17, file: !17, line: 23, type: !18, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_13.c", directory: "/root/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 25, type: !4)
!21 = !DILocation(line: 25, column: 15, scope: !16)
!22 = !DILocation(line: 26, column: 23, scope: !16)
!23 = !DILocation(line: 26, column: 12, scope: !16)
!24 = !DILocation(line: 26, column: 10, scope: !16)
!25 = !DILocation(line: 27, column: 9, scope: !26)
!26 = distinct !DILexicalBlock(scope: !16, file: !17, line: 27, column: 9)
!27 = !DILocation(line: 27, column: 14, scope: !26)
!28 = !DILocation(line: 27, column: 9, scope: !16)
!29 = !DILocation(line: 27, column: 24, scope: !30)
!30 = distinct !DILexicalBlock(scope: !26, file: !17, line: 27, column: 23)
!31 = !DILocation(line: 28, column: 8, scope: !32)
!32 = distinct !DILexicalBlock(scope: !16, file: !17, line: 28, column: 8)
!33 = !DILocation(line: 28, column: 25, scope: !32)
!34 = !DILocation(line: 28, column: 8, scope: !16)
!35 = !DILocation(line: 31, column: 17, scope: !36)
!36 = distinct !DILexicalBlock(scope: !32, file: !17, line: 29, column: 5)
!37 = !DILocation(line: 31, column: 9, scope: !36)
!38 = !DILocation(line: 32, column: 9, scope: !36)
!39 = !DILocation(line: 32, column: 21, scope: !36)
!40 = !DILocation(line: 33, column: 5, scope: !36)
!41 = !DILocalVariable(name: "dest", scope: !42, file: !17, line: 35, type: !43)
!42 = distinct !DILexicalBlock(scope: !16, file: !17, line: 34, column: 5)
!43 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 1600, elements: !44)
!44 = !{!45}
!45 = !DISubrange(count: 50)
!46 = !DILocation(line: 35, column: 17, scope: !42)
!47 = !DILocalVariable(name: "i", scope: !42, file: !17, line: 36, type: !48)
!48 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !6, line: 46, baseType: !49)
!49 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!50 = !DILocation(line: 36, column: 16, scope: !42)
!51 = !DILocalVariable(name: "dataLen", scope: !42, file: !17, line: 36, type: !48)
!52 = !DILocation(line: 36, column: 19, scope: !42)
!53 = !DILocation(line: 37, column: 26, scope: !42)
!54 = !DILocation(line: 37, column: 19, scope: !42)
!55 = !DILocation(line: 37, column: 17, scope: !42)
!56 = !DILocation(line: 39, column: 16, scope: !57)
!57 = distinct !DILexicalBlock(scope: !42, file: !17, line: 39, column: 9)
!58 = !DILocation(line: 39, column: 14, scope: !57)
!59 = !DILocation(line: 39, column: 21, scope: !60)
!60 = distinct !DILexicalBlock(scope: !57, file: !17, line: 39, column: 9)
!61 = !DILocation(line: 39, column: 25, scope: !60)
!62 = !DILocation(line: 39, column: 23, scope: !60)
!63 = !DILocation(line: 39, column: 9, scope: !57)
!64 = !DILocation(line: 41, column: 23, scope: !65)
!65 = distinct !DILexicalBlock(scope: !60, file: !17, line: 40, column: 9)
!66 = !DILocation(line: 41, column: 28, scope: !65)
!67 = !DILocation(line: 41, column: 18, scope: !65)
!68 = !DILocation(line: 41, column: 13, scope: !65)
!69 = !DILocation(line: 41, column: 21, scope: !65)
!70 = !DILocation(line: 42, column: 9, scope: !65)
!71 = !DILocation(line: 39, column: 35, scope: !60)
!72 = !DILocation(line: 39, column: 9, scope: !60)
!73 = distinct !{!73, !63, !74, !75}
!74 = !DILocation(line: 42, column: 9, scope: !57)
!75 = !{!"llvm.loop.mustprogress"}
!76 = !DILocation(line: 43, column: 9, scope: !42)
!77 = !DILocation(line: 43, column: 20, scope: !42)
!78 = !DILocation(line: 44, column: 20, scope: !42)
!79 = !DILocation(line: 44, column: 9, scope: !42)
!80 = !DILocation(line: 45, column: 14, scope: !42)
!81 = !DILocation(line: 45, column: 9, scope: !42)
!82 = !DILocation(line: 47, column: 1, scope: !16)
!83 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_13_good", scope: !17, file: !17, line: 112, type: !18, scopeLine: 113, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!84 = !DILocation(line: 114, column: 5, scope: !83)
!85 = !DILocation(line: 115, column: 5, scope: !83)
!86 = !DILocation(line: 116, column: 1, scope: !83)
!87 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 128, type: !88, scopeLine: 129, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!88 = !DISubroutineType(types: !89)
!89 = !{!7, !7, !90}
!90 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !91, size: 64)
!91 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !92, size: 64)
!92 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!93 = !DILocalVariable(name: "argc", arg: 1, scope: !87, file: !17, line: 128, type: !7)
!94 = !DILocation(line: 128, column: 14, scope: !87)
!95 = !DILocalVariable(name: "argv", arg: 2, scope: !87, file: !17, line: 128, type: !90)
!96 = !DILocation(line: 128, column: 27, scope: !87)
!97 = !DILocation(line: 131, column: 22, scope: !87)
!98 = !DILocation(line: 131, column: 12, scope: !87)
!99 = !DILocation(line: 131, column: 5, scope: !87)
!100 = !DILocation(line: 133, column: 5, scope: !87)
!101 = !DILocation(line: 134, column: 5, scope: !87)
!102 = !DILocation(line: 135, column: 5, scope: !87)
!103 = !DILocation(line: 138, column: 5, scope: !87)
!104 = !DILocation(line: 139, column: 5, scope: !87)
!105 = !DILocation(line: 140, column: 5, scope: !87)
!106 = !DILocation(line: 142, column: 5, scope: !87)
!107 = distinct !DISubprogram(name: "goodG2B1", scope: !17, file: !17, line: 54, type: !18, scopeLine: 55, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!108 = !DILocalVariable(name: "data", scope: !107, file: !17, line: 56, type: !4)
!109 = !DILocation(line: 56, column: 15, scope: !107)
!110 = !DILocation(line: 57, column: 23, scope: !107)
!111 = !DILocation(line: 57, column: 12, scope: !107)
!112 = !DILocation(line: 57, column: 10, scope: !107)
!113 = !DILocation(line: 58, column: 9, scope: !114)
!114 = distinct !DILexicalBlock(scope: !107, file: !17, line: 58, column: 9)
!115 = !DILocation(line: 58, column: 14, scope: !114)
!116 = !DILocation(line: 58, column: 9, scope: !107)
!117 = !DILocation(line: 58, column: 24, scope: !118)
!118 = distinct !DILexicalBlock(scope: !114, file: !17, line: 58, column: 23)
!119 = !DILocation(line: 59, column: 8, scope: !120)
!120 = distinct !DILexicalBlock(scope: !107, file: !17, line: 59, column: 8)
!121 = !DILocation(line: 59, column: 25, scope: !120)
!122 = !DILocation(line: 59, column: 8, scope: !107)
!123 = !DILocation(line: 62, column: 9, scope: !124)
!124 = distinct !DILexicalBlock(scope: !120, file: !17, line: 60, column: 5)
!125 = !DILocation(line: 63, column: 5, scope: !124)
!126 = !DILocation(line: 67, column: 17, scope: !127)
!127 = distinct !DILexicalBlock(scope: !120, file: !17, line: 65, column: 5)
!128 = !DILocation(line: 67, column: 9, scope: !127)
!129 = !DILocation(line: 68, column: 9, scope: !127)
!130 = !DILocation(line: 68, column: 20, scope: !127)
!131 = !DILocalVariable(name: "dest", scope: !132, file: !17, line: 71, type: !43)
!132 = distinct !DILexicalBlock(scope: !107, file: !17, line: 70, column: 5)
!133 = !DILocation(line: 71, column: 17, scope: !132)
!134 = !DILocalVariable(name: "i", scope: !132, file: !17, line: 72, type: !48)
!135 = !DILocation(line: 72, column: 16, scope: !132)
!136 = !DILocalVariable(name: "dataLen", scope: !132, file: !17, line: 72, type: !48)
!137 = !DILocation(line: 72, column: 19, scope: !132)
!138 = !DILocation(line: 73, column: 26, scope: !132)
!139 = !DILocation(line: 73, column: 19, scope: !132)
!140 = !DILocation(line: 73, column: 17, scope: !132)
!141 = !DILocation(line: 75, column: 16, scope: !142)
!142 = distinct !DILexicalBlock(scope: !132, file: !17, line: 75, column: 9)
!143 = !DILocation(line: 75, column: 14, scope: !142)
!144 = !DILocation(line: 75, column: 21, scope: !145)
!145 = distinct !DILexicalBlock(scope: !142, file: !17, line: 75, column: 9)
!146 = !DILocation(line: 75, column: 25, scope: !145)
!147 = !DILocation(line: 75, column: 23, scope: !145)
!148 = !DILocation(line: 75, column: 9, scope: !142)
!149 = !DILocation(line: 77, column: 23, scope: !150)
!150 = distinct !DILexicalBlock(scope: !145, file: !17, line: 76, column: 9)
!151 = !DILocation(line: 77, column: 28, scope: !150)
!152 = !DILocation(line: 77, column: 18, scope: !150)
!153 = !DILocation(line: 77, column: 13, scope: !150)
!154 = !DILocation(line: 77, column: 21, scope: !150)
!155 = !DILocation(line: 78, column: 9, scope: !150)
!156 = !DILocation(line: 75, column: 35, scope: !145)
!157 = !DILocation(line: 75, column: 9, scope: !145)
!158 = distinct !{!158, !148, !159, !75}
!159 = !DILocation(line: 78, column: 9, scope: !142)
!160 = !DILocation(line: 79, column: 9, scope: !132)
!161 = !DILocation(line: 79, column: 20, scope: !132)
!162 = !DILocation(line: 80, column: 20, scope: !132)
!163 = !DILocation(line: 80, column: 9, scope: !132)
!164 = !DILocation(line: 81, column: 14, scope: !132)
!165 = !DILocation(line: 81, column: 9, scope: !132)
!166 = !DILocation(line: 83, column: 1, scope: !107)
!167 = distinct !DISubprogram(name: "goodG2B2", scope: !17, file: !17, line: 86, type: !18, scopeLine: 87, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!168 = !DILocalVariable(name: "data", scope: !167, file: !17, line: 88, type: !4)
!169 = !DILocation(line: 88, column: 15, scope: !167)
!170 = !DILocation(line: 89, column: 23, scope: !167)
!171 = !DILocation(line: 89, column: 12, scope: !167)
!172 = !DILocation(line: 89, column: 10, scope: !167)
!173 = !DILocation(line: 90, column: 9, scope: !174)
!174 = distinct !DILexicalBlock(scope: !167, file: !17, line: 90, column: 9)
!175 = !DILocation(line: 90, column: 14, scope: !174)
!176 = !DILocation(line: 90, column: 9, scope: !167)
!177 = !DILocation(line: 90, column: 24, scope: !178)
!178 = distinct !DILexicalBlock(scope: !174, file: !17, line: 90, column: 23)
!179 = !DILocation(line: 91, column: 8, scope: !180)
!180 = distinct !DILexicalBlock(scope: !167, file: !17, line: 91, column: 8)
!181 = !DILocation(line: 91, column: 25, scope: !180)
!182 = !DILocation(line: 91, column: 8, scope: !167)
!183 = !DILocation(line: 94, column: 17, scope: !184)
!184 = distinct !DILexicalBlock(scope: !180, file: !17, line: 92, column: 5)
!185 = !DILocation(line: 94, column: 9, scope: !184)
!186 = !DILocation(line: 95, column: 9, scope: !184)
!187 = !DILocation(line: 95, column: 20, scope: !184)
!188 = !DILocation(line: 96, column: 5, scope: !184)
!189 = !DILocalVariable(name: "dest", scope: !190, file: !17, line: 98, type: !43)
!190 = distinct !DILexicalBlock(scope: !167, file: !17, line: 97, column: 5)
!191 = !DILocation(line: 98, column: 17, scope: !190)
!192 = !DILocalVariable(name: "i", scope: !190, file: !17, line: 99, type: !48)
!193 = !DILocation(line: 99, column: 16, scope: !190)
!194 = !DILocalVariable(name: "dataLen", scope: !190, file: !17, line: 99, type: !48)
!195 = !DILocation(line: 99, column: 19, scope: !190)
!196 = !DILocation(line: 100, column: 26, scope: !190)
!197 = !DILocation(line: 100, column: 19, scope: !190)
!198 = !DILocation(line: 100, column: 17, scope: !190)
!199 = !DILocation(line: 102, column: 16, scope: !200)
!200 = distinct !DILexicalBlock(scope: !190, file: !17, line: 102, column: 9)
!201 = !DILocation(line: 102, column: 14, scope: !200)
!202 = !DILocation(line: 102, column: 21, scope: !203)
!203 = distinct !DILexicalBlock(scope: !200, file: !17, line: 102, column: 9)
!204 = !DILocation(line: 102, column: 25, scope: !203)
!205 = !DILocation(line: 102, column: 23, scope: !203)
!206 = !DILocation(line: 102, column: 9, scope: !200)
!207 = !DILocation(line: 104, column: 23, scope: !208)
!208 = distinct !DILexicalBlock(scope: !203, file: !17, line: 103, column: 9)
!209 = !DILocation(line: 104, column: 28, scope: !208)
!210 = !DILocation(line: 104, column: 18, scope: !208)
!211 = !DILocation(line: 104, column: 13, scope: !208)
!212 = !DILocation(line: 104, column: 21, scope: !208)
!213 = !DILocation(line: 105, column: 9, scope: !208)
!214 = !DILocation(line: 102, column: 35, scope: !203)
!215 = !DILocation(line: 102, column: 9, scope: !203)
!216 = distinct !{!216, !206, !217, !75}
!217 = !DILocation(line: 105, column: 9, scope: !200)
!218 = !DILocation(line: 106, column: 9, scope: !190)
!219 = !DILocation(line: 106, column: 20, scope: !190)
!220 = !DILocation(line: 107, column: 20, scope: !190)
!221 = !DILocation(line: 107, column: 9, scope: !190)
!222 = !DILocation(line: 108, column: 14, scope: !190)
!223 = !DILocation(line: 108, column: 9, scope: !190)
!224 = !DILocation(line: 110, column: 1, scope: !167)
