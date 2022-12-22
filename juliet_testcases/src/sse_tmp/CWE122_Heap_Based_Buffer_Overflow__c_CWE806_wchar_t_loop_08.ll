; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_08.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_08.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_08_bad() #0 !dbg !16 {
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
  %call1 = call i32 @staticReturnsTrue(), !dbg !31
  %tobool = icmp ne i32 %call1, 0, !dbg !31
  br i1 %tobool, label %if.then2, label %if.end4, !dbg !33

if.then2:                                         ; preds = %if.end
  %2 = load i32*, i32** %data, align 8, !dbg !34
  %call3 = call i32* @wmemset(i32* %2, i32 65, i64 99) #7, !dbg !36
  %3 = load i32*, i32** %data, align 8, !dbg !37
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !37
  store i32 0, i32* %arrayidx, align 4, !dbg !38
  br label %if.end4, !dbg !39

if.end4:                                          ; preds = %if.then2, %if.end
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !40, metadata !DIExpression()), !dbg !45
  %4 = bitcast [50 x i32]* %dest to i8*, !dbg !45
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 200, i1 false), !dbg !45
  call void @llvm.dbg.declare(metadata i64* %i, metadata !46, metadata !DIExpression()), !dbg !49
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !50, metadata !DIExpression()), !dbg !51
  %5 = load i32*, i32** %data, align 8, !dbg !52
  %call5 = call i64 @wcslen(i32* %5) #9, !dbg !53
  store i64 %call5, i64* %dataLen, align 8, !dbg !54
  store i64 0, i64* %i, align 8, !dbg !55
  br label %for.cond, !dbg !57

for.cond:                                         ; preds = %for.inc, %if.end4
  %6 = load i64, i64* %i, align 8, !dbg !58
  %7 = load i64, i64* %dataLen, align 8, !dbg !60
  %cmp6 = icmp ult i64 %6, %7, !dbg !61
  br i1 %cmp6, label %for.body, label %for.end, !dbg !62

for.body:                                         ; preds = %for.cond
  %8 = load i32*, i32** %data, align 8, !dbg !63
  %9 = load i64, i64* %i, align 8, !dbg !65
  %arrayidx7 = getelementptr inbounds i32, i32* %8, i64 %9, !dbg !63
  %10 = load i32, i32* %arrayidx7, align 4, !dbg !63
  %11 = load i64, i64* %i, align 8, !dbg !66
  %arrayidx8 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %11, !dbg !67
  store i32 %10, i32* %arrayidx8, align 4, !dbg !68
  br label %for.inc, !dbg !69

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %i, align 8, !dbg !70
  %inc = add i64 %12, 1, !dbg !70
  store i64 %inc, i64* %i, align 8, !dbg !70
  br label %for.cond, !dbg !71, !llvm.loop !72

for.end:                                          ; preds = %for.cond
  %arrayidx9 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !75
  store i32 0, i32* %arrayidx9, align 4, !dbg !76
  %13 = load i32*, i32** %data, align 8, !dbg !77
  call void @printWLine(i32* %13), !dbg !78
  %14 = load i32*, i32** %data, align 8, !dbg !79
  %15 = bitcast i32* %14 to i8*, !dbg !79
  call void @free(i8* %15) #7, !dbg !80
  ret void, !dbg !81
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_08_good() #0 !dbg !82 {
entry:
  call void @goodG2B1(), !dbg !83
  call void @goodG2B2(), !dbg !84
  ret void, !dbg !85
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !86 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !92, metadata !DIExpression()), !dbg !93
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !94, metadata !DIExpression()), !dbg !95
  %call = call i64 @time(i64* null) #7, !dbg !96
  %conv = trunc i64 %call to i32, !dbg !97
  call void @srand(i32 %conv) #7, !dbg !98
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !99
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_08_good(), !dbg !100
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !101
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !102
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_08_bad(), !dbg !103
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !104
  ret i32 0, !dbg !105
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #6

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !106 {
entry:
  ret i32 1, !dbg !109
}

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
  %call1 = call i32 @staticReturnsFalse(), !dbg !122
  %tobool = icmp ne i32 %call1, 0, !dbg !122
  br i1 %tobool, label %if.then2, label %if.else, !dbg !124

if.then2:                                         ; preds = %if.end
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !125
  br label %if.end4, !dbg !127

if.else:                                          ; preds = %if.end
  %2 = load i32*, i32** %data, align 8, !dbg !128
  %call3 = call i32* @wmemset(i32* %2, i32 65, i64 49) #7, !dbg !130
  %3 = load i32*, i32** %data, align 8, !dbg !131
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 49, !dbg !131
  store i32 0, i32* %arrayidx, align 4, !dbg !132
  br label %if.end4

if.end4:                                          ; preds = %if.else, %if.then2
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !133, metadata !DIExpression()), !dbg !135
  %4 = bitcast [50 x i32]* %dest to i8*, !dbg !135
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 200, i1 false), !dbg !135
  call void @llvm.dbg.declare(metadata i64* %i, metadata !136, metadata !DIExpression()), !dbg !137
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !138, metadata !DIExpression()), !dbg !139
  %5 = load i32*, i32** %data, align 8, !dbg !140
  %call5 = call i64 @wcslen(i32* %5) #9, !dbg !141
  store i64 %call5, i64* %dataLen, align 8, !dbg !142
  store i64 0, i64* %i, align 8, !dbg !143
  br label %for.cond, !dbg !145

for.cond:                                         ; preds = %for.inc, %if.end4
  %6 = load i64, i64* %i, align 8, !dbg !146
  %7 = load i64, i64* %dataLen, align 8, !dbg !148
  %cmp6 = icmp ult i64 %6, %7, !dbg !149
  br i1 %cmp6, label %for.body, label %for.end, !dbg !150

for.body:                                         ; preds = %for.cond
  %8 = load i32*, i32** %data, align 8, !dbg !151
  %9 = load i64, i64* %i, align 8, !dbg !153
  %arrayidx7 = getelementptr inbounds i32, i32* %8, i64 %9, !dbg !151
  %10 = load i32, i32* %arrayidx7, align 4, !dbg !151
  %11 = load i64, i64* %i, align 8, !dbg !154
  %arrayidx8 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %11, !dbg !155
  store i32 %10, i32* %arrayidx8, align 4, !dbg !156
  br label %for.inc, !dbg !157

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %i, align 8, !dbg !158
  %inc = add i64 %12, 1, !dbg !158
  store i64 %inc, i64* %i, align 8, !dbg !158
  br label %for.cond, !dbg !159, !llvm.loop !160

for.end:                                          ; preds = %for.cond
  %arrayidx9 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !162
  store i32 0, i32* %arrayidx9, align 4, !dbg !163
  %13 = load i32*, i32** %data, align 8, !dbg !164
  call void @printWLine(i32* %13), !dbg !165
  %14 = load i32*, i32** %data, align 8, !dbg !166
  %15 = bitcast i32* %14 to i8*, !dbg !166
  call void @free(i8* %15) #7, !dbg !167
  ret void, !dbg !168
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !169 {
entry:
  ret i32 0, !dbg !170
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !171 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !172, metadata !DIExpression()), !dbg !173
  %call = call noalias align 16 i8* @malloc(i64 400) #7, !dbg !174
  %0 = bitcast i8* %call to i32*, !dbg !175
  store i32* %0, i32** %data, align 8, !dbg !176
  %1 = load i32*, i32** %data, align 8, !dbg !177
  %cmp = icmp eq i32* %1, null, !dbg !179
  br i1 %cmp, label %if.then, label %if.end, !dbg !180

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !181
  unreachable, !dbg !181

if.end:                                           ; preds = %entry
  %call1 = call i32 @staticReturnsTrue(), !dbg !183
  %tobool = icmp ne i32 %call1, 0, !dbg !183
  br i1 %tobool, label %if.then2, label %if.end4, !dbg !185

if.then2:                                         ; preds = %if.end
  %2 = load i32*, i32** %data, align 8, !dbg !186
  %call3 = call i32* @wmemset(i32* %2, i32 65, i64 49) #7, !dbg !188
  %3 = load i32*, i32** %data, align 8, !dbg !189
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 49, !dbg !189
  store i32 0, i32* %arrayidx, align 4, !dbg !190
  br label %if.end4, !dbg !191

if.end4:                                          ; preds = %if.then2, %if.end
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !192, metadata !DIExpression()), !dbg !194
  %4 = bitcast [50 x i32]* %dest to i8*, !dbg !194
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 200, i1 false), !dbg !194
  call void @llvm.dbg.declare(metadata i64* %i, metadata !195, metadata !DIExpression()), !dbg !196
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !197, metadata !DIExpression()), !dbg !198
  %5 = load i32*, i32** %data, align 8, !dbg !199
  %call5 = call i64 @wcslen(i32* %5) #9, !dbg !200
  store i64 %call5, i64* %dataLen, align 8, !dbg !201
  store i64 0, i64* %i, align 8, !dbg !202
  br label %for.cond, !dbg !204

for.cond:                                         ; preds = %for.inc, %if.end4
  %6 = load i64, i64* %i, align 8, !dbg !205
  %7 = load i64, i64* %dataLen, align 8, !dbg !207
  %cmp6 = icmp ult i64 %6, %7, !dbg !208
  br i1 %cmp6, label %for.body, label %for.end, !dbg !209

for.body:                                         ; preds = %for.cond
  %8 = load i32*, i32** %data, align 8, !dbg !210
  %9 = load i64, i64* %i, align 8, !dbg !212
  %arrayidx7 = getelementptr inbounds i32, i32* %8, i64 %9, !dbg !210
  %10 = load i32, i32* %arrayidx7, align 4, !dbg !210
  %11 = load i64, i64* %i, align 8, !dbg !213
  %arrayidx8 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %11, !dbg !214
  store i32 %10, i32* %arrayidx8, align 4, !dbg !215
  br label %for.inc, !dbg !216

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %i, align 8, !dbg !217
  %inc = add i64 %12, 1, !dbg !217
  store i64 %inc, i64* %i, align 8, !dbg !217
  br label %for.cond, !dbg !218, !llvm.loop !219

for.end:                                          ; preds = %for.cond
  %arrayidx9 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !221
  store i32 0, i32* %arrayidx9, align 4, !dbg !222
  %13 = load i32*, i32** %data, align 8, !dbg !223
  call void @printWLine(i32* %13), !dbg !224
  %14 = load i32*, i32** %data, align 8, !dbg !225
  %15 = bitcast i32* %14 to i8*, !dbg !225
  call void @free(i8* %15) #7, !dbg !226
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

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_08.c", directory: "/root/SSE-Assessment")
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
!16 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_08_bad", scope: !17, file: !17, line: 37, type: !18, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_08.c", directory: "/root/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 39, type: !4)
!21 = !DILocation(line: 39, column: 15, scope: !16)
!22 = !DILocation(line: 40, column: 23, scope: !16)
!23 = !DILocation(line: 40, column: 12, scope: !16)
!24 = !DILocation(line: 40, column: 10, scope: !16)
!25 = !DILocation(line: 41, column: 9, scope: !26)
!26 = distinct !DILexicalBlock(scope: !16, file: !17, line: 41, column: 9)
!27 = !DILocation(line: 41, column: 14, scope: !26)
!28 = !DILocation(line: 41, column: 9, scope: !16)
!29 = !DILocation(line: 41, column: 24, scope: !30)
!30 = distinct !DILexicalBlock(scope: !26, file: !17, line: 41, column: 23)
!31 = !DILocation(line: 42, column: 8, scope: !32)
!32 = distinct !DILexicalBlock(scope: !16, file: !17, line: 42, column: 8)
!33 = !DILocation(line: 42, column: 8, scope: !16)
!34 = !DILocation(line: 45, column: 17, scope: !35)
!35 = distinct !DILexicalBlock(scope: !32, file: !17, line: 43, column: 5)
!36 = !DILocation(line: 45, column: 9, scope: !35)
!37 = !DILocation(line: 46, column: 9, scope: !35)
!38 = !DILocation(line: 46, column: 21, scope: !35)
!39 = !DILocation(line: 47, column: 5, scope: !35)
!40 = !DILocalVariable(name: "dest", scope: !41, file: !17, line: 49, type: !42)
!41 = distinct !DILexicalBlock(scope: !16, file: !17, line: 48, column: 5)
!42 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 1600, elements: !43)
!43 = !{!44}
!44 = !DISubrange(count: 50)
!45 = !DILocation(line: 49, column: 17, scope: !41)
!46 = !DILocalVariable(name: "i", scope: !41, file: !17, line: 50, type: !47)
!47 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !6, line: 46, baseType: !48)
!48 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!49 = !DILocation(line: 50, column: 16, scope: !41)
!50 = !DILocalVariable(name: "dataLen", scope: !41, file: !17, line: 50, type: !47)
!51 = !DILocation(line: 50, column: 19, scope: !41)
!52 = !DILocation(line: 51, column: 26, scope: !41)
!53 = !DILocation(line: 51, column: 19, scope: !41)
!54 = !DILocation(line: 51, column: 17, scope: !41)
!55 = !DILocation(line: 53, column: 16, scope: !56)
!56 = distinct !DILexicalBlock(scope: !41, file: !17, line: 53, column: 9)
!57 = !DILocation(line: 53, column: 14, scope: !56)
!58 = !DILocation(line: 53, column: 21, scope: !59)
!59 = distinct !DILexicalBlock(scope: !56, file: !17, line: 53, column: 9)
!60 = !DILocation(line: 53, column: 25, scope: !59)
!61 = !DILocation(line: 53, column: 23, scope: !59)
!62 = !DILocation(line: 53, column: 9, scope: !56)
!63 = !DILocation(line: 55, column: 23, scope: !64)
!64 = distinct !DILexicalBlock(scope: !59, file: !17, line: 54, column: 9)
!65 = !DILocation(line: 55, column: 28, scope: !64)
!66 = !DILocation(line: 55, column: 18, scope: !64)
!67 = !DILocation(line: 55, column: 13, scope: !64)
!68 = !DILocation(line: 55, column: 21, scope: !64)
!69 = !DILocation(line: 56, column: 9, scope: !64)
!70 = !DILocation(line: 53, column: 35, scope: !59)
!71 = !DILocation(line: 53, column: 9, scope: !59)
!72 = distinct !{!72, !62, !73, !74}
!73 = !DILocation(line: 56, column: 9, scope: !56)
!74 = !{!"llvm.loop.mustprogress"}
!75 = !DILocation(line: 57, column: 9, scope: !41)
!76 = !DILocation(line: 57, column: 20, scope: !41)
!77 = !DILocation(line: 58, column: 20, scope: !41)
!78 = !DILocation(line: 58, column: 9, scope: !41)
!79 = !DILocation(line: 59, column: 14, scope: !41)
!80 = !DILocation(line: 59, column: 9, scope: !41)
!81 = !DILocation(line: 61, column: 1, scope: !16)
!82 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_08_good", scope: !17, file: !17, line: 126, type: !18, scopeLine: 127, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!83 = !DILocation(line: 128, column: 5, scope: !82)
!84 = !DILocation(line: 129, column: 5, scope: !82)
!85 = !DILocation(line: 130, column: 1, scope: !82)
!86 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 142, type: !87, scopeLine: 143, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!87 = !DISubroutineType(types: !88)
!88 = !{!7, !7, !89}
!89 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !90, size: 64)
!90 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !91, size: 64)
!91 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!92 = !DILocalVariable(name: "argc", arg: 1, scope: !86, file: !17, line: 142, type: !7)
!93 = !DILocation(line: 142, column: 14, scope: !86)
!94 = !DILocalVariable(name: "argv", arg: 2, scope: !86, file: !17, line: 142, type: !89)
!95 = !DILocation(line: 142, column: 27, scope: !86)
!96 = !DILocation(line: 145, column: 22, scope: !86)
!97 = !DILocation(line: 145, column: 12, scope: !86)
!98 = !DILocation(line: 145, column: 5, scope: !86)
!99 = !DILocation(line: 147, column: 5, scope: !86)
!100 = !DILocation(line: 148, column: 5, scope: !86)
!101 = !DILocation(line: 149, column: 5, scope: !86)
!102 = !DILocation(line: 152, column: 5, scope: !86)
!103 = !DILocation(line: 153, column: 5, scope: !86)
!104 = !DILocation(line: 154, column: 5, scope: !86)
!105 = !DILocation(line: 156, column: 5, scope: !86)
!106 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !17, file: !17, line: 25, type: !107, scopeLine: 26, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!107 = !DISubroutineType(types: !108)
!108 = !{!7}
!109 = !DILocation(line: 27, column: 5, scope: !106)
!110 = distinct !DISubprogram(name: "goodG2B1", scope: !17, file: !17, line: 68, type: !18, scopeLine: 69, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!111 = !DILocalVariable(name: "data", scope: !110, file: !17, line: 70, type: !4)
!112 = !DILocation(line: 70, column: 15, scope: !110)
!113 = !DILocation(line: 71, column: 23, scope: !110)
!114 = !DILocation(line: 71, column: 12, scope: !110)
!115 = !DILocation(line: 71, column: 10, scope: !110)
!116 = !DILocation(line: 72, column: 9, scope: !117)
!117 = distinct !DILexicalBlock(scope: !110, file: !17, line: 72, column: 9)
!118 = !DILocation(line: 72, column: 14, scope: !117)
!119 = !DILocation(line: 72, column: 9, scope: !110)
!120 = !DILocation(line: 72, column: 24, scope: !121)
!121 = distinct !DILexicalBlock(scope: !117, file: !17, line: 72, column: 23)
!122 = !DILocation(line: 73, column: 8, scope: !123)
!123 = distinct !DILexicalBlock(scope: !110, file: !17, line: 73, column: 8)
!124 = !DILocation(line: 73, column: 8, scope: !110)
!125 = !DILocation(line: 76, column: 9, scope: !126)
!126 = distinct !DILexicalBlock(scope: !123, file: !17, line: 74, column: 5)
!127 = !DILocation(line: 77, column: 5, scope: !126)
!128 = !DILocation(line: 81, column: 17, scope: !129)
!129 = distinct !DILexicalBlock(scope: !123, file: !17, line: 79, column: 5)
!130 = !DILocation(line: 81, column: 9, scope: !129)
!131 = !DILocation(line: 82, column: 9, scope: !129)
!132 = !DILocation(line: 82, column: 20, scope: !129)
!133 = !DILocalVariable(name: "dest", scope: !134, file: !17, line: 85, type: !42)
!134 = distinct !DILexicalBlock(scope: !110, file: !17, line: 84, column: 5)
!135 = !DILocation(line: 85, column: 17, scope: !134)
!136 = !DILocalVariable(name: "i", scope: !134, file: !17, line: 86, type: !47)
!137 = !DILocation(line: 86, column: 16, scope: !134)
!138 = !DILocalVariable(name: "dataLen", scope: !134, file: !17, line: 86, type: !47)
!139 = !DILocation(line: 86, column: 19, scope: !134)
!140 = !DILocation(line: 87, column: 26, scope: !134)
!141 = !DILocation(line: 87, column: 19, scope: !134)
!142 = !DILocation(line: 87, column: 17, scope: !134)
!143 = !DILocation(line: 89, column: 16, scope: !144)
!144 = distinct !DILexicalBlock(scope: !134, file: !17, line: 89, column: 9)
!145 = !DILocation(line: 89, column: 14, scope: !144)
!146 = !DILocation(line: 89, column: 21, scope: !147)
!147 = distinct !DILexicalBlock(scope: !144, file: !17, line: 89, column: 9)
!148 = !DILocation(line: 89, column: 25, scope: !147)
!149 = !DILocation(line: 89, column: 23, scope: !147)
!150 = !DILocation(line: 89, column: 9, scope: !144)
!151 = !DILocation(line: 91, column: 23, scope: !152)
!152 = distinct !DILexicalBlock(scope: !147, file: !17, line: 90, column: 9)
!153 = !DILocation(line: 91, column: 28, scope: !152)
!154 = !DILocation(line: 91, column: 18, scope: !152)
!155 = !DILocation(line: 91, column: 13, scope: !152)
!156 = !DILocation(line: 91, column: 21, scope: !152)
!157 = !DILocation(line: 92, column: 9, scope: !152)
!158 = !DILocation(line: 89, column: 35, scope: !147)
!159 = !DILocation(line: 89, column: 9, scope: !147)
!160 = distinct !{!160, !150, !161, !74}
!161 = !DILocation(line: 92, column: 9, scope: !144)
!162 = !DILocation(line: 93, column: 9, scope: !134)
!163 = !DILocation(line: 93, column: 20, scope: !134)
!164 = !DILocation(line: 94, column: 20, scope: !134)
!165 = !DILocation(line: 94, column: 9, scope: !134)
!166 = !DILocation(line: 95, column: 14, scope: !134)
!167 = !DILocation(line: 95, column: 9, scope: !134)
!168 = !DILocation(line: 97, column: 1, scope: !110)
!169 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !17, file: !17, line: 30, type: !107, scopeLine: 31, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!170 = !DILocation(line: 32, column: 5, scope: !169)
!171 = distinct !DISubprogram(name: "goodG2B2", scope: !17, file: !17, line: 100, type: !18, scopeLine: 101, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!172 = !DILocalVariable(name: "data", scope: !171, file: !17, line: 102, type: !4)
!173 = !DILocation(line: 102, column: 15, scope: !171)
!174 = !DILocation(line: 103, column: 23, scope: !171)
!175 = !DILocation(line: 103, column: 12, scope: !171)
!176 = !DILocation(line: 103, column: 10, scope: !171)
!177 = !DILocation(line: 104, column: 9, scope: !178)
!178 = distinct !DILexicalBlock(scope: !171, file: !17, line: 104, column: 9)
!179 = !DILocation(line: 104, column: 14, scope: !178)
!180 = !DILocation(line: 104, column: 9, scope: !171)
!181 = !DILocation(line: 104, column: 24, scope: !182)
!182 = distinct !DILexicalBlock(scope: !178, file: !17, line: 104, column: 23)
!183 = !DILocation(line: 105, column: 8, scope: !184)
!184 = distinct !DILexicalBlock(scope: !171, file: !17, line: 105, column: 8)
!185 = !DILocation(line: 105, column: 8, scope: !171)
!186 = !DILocation(line: 108, column: 17, scope: !187)
!187 = distinct !DILexicalBlock(scope: !184, file: !17, line: 106, column: 5)
!188 = !DILocation(line: 108, column: 9, scope: !187)
!189 = !DILocation(line: 109, column: 9, scope: !187)
!190 = !DILocation(line: 109, column: 20, scope: !187)
!191 = !DILocation(line: 110, column: 5, scope: !187)
!192 = !DILocalVariable(name: "dest", scope: !193, file: !17, line: 112, type: !42)
!193 = distinct !DILexicalBlock(scope: !171, file: !17, line: 111, column: 5)
!194 = !DILocation(line: 112, column: 17, scope: !193)
!195 = !DILocalVariable(name: "i", scope: !193, file: !17, line: 113, type: !47)
!196 = !DILocation(line: 113, column: 16, scope: !193)
!197 = !DILocalVariable(name: "dataLen", scope: !193, file: !17, line: 113, type: !47)
!198 = !DILocation(line: 113, column: 19, scope: !193)
!199 = !DILocation(line: 114, column: 26, scope: !193)
!200 = !DILocation(line: 114, column: 19, scope: !193)
!201 = !DILocation(line: 114, column: 17, scope: !193)
!202 = !DILocation(line: 116, column: 16, scope: !203)
!203 = distinct !DILexicalBlock(scope: !193, file: !17, line: 116, column: 9)
!204 = !DILocation(line: 116, column: 14, scope: !203)
!205 = !DILocation(line: 116, column: 21, scope: !206)
!206 = distinct !DILexicalBlock(scope: !203, file: !17, line: 116, column: 9)
!207 = !DILocation(line: 116, column: 25, scope: !206)
!208 = !DILocation(line: 116, column: 23, scope: !206)
!209 = !DILocation(line: 116, column: 9, scope: !203)
!210 = !DILocation(line: 118, column: 23, scope: !211)
!211 = distinct !DILexicalBlock(scope: !206, file: !17, line: 117, column: 9)
!212 = !DILocation(line: 118, column: 28, scope: !211)
!213 = !DILocation(line: 118, column: 18, scope: !211)
!214 = !DILocation(line: 118, column: 13, scope: !211)
!215 = !DILocation(line: 118, column: 21, scope: !211)
!216 = !DILocation(line: 119, column: 9, scope: !211)
!217 = !DILocation(line: 116, column: 35, scope: !206)
!218 = !DILocation(line: 116, column: 9, scope: !206)
!219 = distinct !{!219, !209, !220, !74}
!220 = !DILocation(line: 119, column: 9, scope: !203)
!221 = !DILocation(line: 120, column: 9, scope: !193)
!222 = !DILocation(line: 120, column: 20, scope: !193)
!223 = !DILocation(line: 121, column: 20, scope: !193)
!224 = !DILocation(line: 121, column: 9, scope: !193)
!225 = !DILocation(line: 122, column: 14, scope: !193)
!226 = !DILocation(line: 122, column: 9, scope: !193)
!227 = !DILocation(line: 124, column: 1, scope: !171)
