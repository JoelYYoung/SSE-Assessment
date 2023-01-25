; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_32.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_32.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_32_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %dataPtr1 = alloca i32**, align 8
  %dataPtr2 = alloca i32**, align 8
  %data1 = alloca i32*, align 8
  %data3 = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.declare(metadata i32*** %dataPtr1, metadata !22, metadata !DIExpression()), !dbg !24
  store i32** %data, i32*** %dataPtr1, align 8, !dbg !24
  call void @llvm.dbg.declare(metadata i32*** %dataPtr2, metadata !25, metadata !DIExpression()), !dbg !26
  store i32** %data, i32*** %dataPtr2, align 8, !dbg !26
  %call = call noalias align 16 i8* @malloc(i64 400) #7, !dbg !27
  %0 = bitcast i8* %call to i32*, !dbg !28
  store i32* %0, i32** %data, align 8, !dbg !29
  %1 = load i32*, i32** %data, align 8, !dbg !30
  %cmp = icmp eq i32* %1, null, !dbg !32
  br i1 %cmp, label %if.then, label %if.end, !dbg !33

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !34
  unreachable, !dbg !34

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !36, metadata !DIExpression()), !dbg !38
  %2 = load i32**, i32*** %dataPtr1, align 8, !dbg !39
  %3 = load i32*, i32** %2, align 8, !dbg !40
  store i32* %3, i32** %data1, align 8, !dbg !38
  %4 = load i32*, i32** %data1, align 8, !dbg !41
  %call2 = call i32* @wmemset(i32* %4, i32 65, i64 99) #7, !dbg !42
  %5 = load i32*, i32** %data1, align 8, !dbg !43
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 99, !dbg !43
  store i32 0, i32* %arrayidx, align 4, !dbg !44
  %6 = load i32*, i32** %data1, align 8, !dbg !45
  %7 = load i32**, i32*** %dataPtr1, align 8, !dbg !46
  store i32* %6, i32** %7, align 8, !dbg !47
  call void @llvm.dbg.declare(metadata i32** %data3, metadata !48, metadata !DIExpression()), !dbg !50
  %8 = load i32**, i32*** %dataPtr2, align 8, !dbg !51
  %9 = load i32*, i32** %8, align 8, !dbg !52
  store i32* %9, i32** %data3, align 8, !dbg !50
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !53, metadata !DIExpression()), !dbg !58
  %10 = bitcast [50 x i32]* %dest to i8*, !dbg !58
  call void @llvm.memset.p0i8.i64(i8* align 16 %10, i8 0, i64 200, i1 false), !dbg !58
  call void @llvm.dbg.declare(metadata i64* %i, metadata !59, metadata !DIExpression()), !dbg !62
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !63, metadata !DIExpression()), !dbg !64
  %11 = load i32*, i32** %data3, align 8, !dbg !65
  %call4 = call i64 @wcslen(i32* %11) #9, !dbg !66
  store i64 %call4, i64* %dataLen, align 8, !dbg !67
  store i64 0, i64* %i, align 8, !dbg !68
  br label %for.cond, !dbg !70

for.cond:                                         ; preds = %for.inc, %if.end
  %12 = load i64, i64* %i, align 8, !dbg !71
  %13 = load i64, i64* %dataLen, align 8, !dbg !73
  %cmp5 = icmp ult i64 %12, %13, !dbg !74
  br i1 %cmp5, label %for.body, label %for.end, !dbg !75

for.body:                                         ; preds = %for.cond
  %14 = load i32*, i32** %data3, align 8, !dbg !76
  %15 = load i64, i64* %i, align 8, !dbg !78
  %arrayidx6 = getelementptr inbounds i32, i32* %14, i64 %15, !dbg !76
  %16 = load i32, i32* %arrayidx6, align 4, !dbg !76
  %17 = load i64, i64* %i, align 8, !dbg !79
  %arrayidx7 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %17, !dbg !80
  store i32 %16, i32* %arrayidx7, align 4, !dbg !81
  br label %for.inc, !dbg !82

for.inc:                                          ; preds = %for.body
  %18 = load i64, i64* %i, align 8, !dbg !83
  %inc = add i64 %18, 1, !dbg !83
  store i64 %inc, i64* %i, align 8, !dbg !83
  br label %for.cond, !dbg !84, !llvm.loop !85

for.end:                                          ; preds = %for.cond
  %arrayidx8 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !88
  store i32 0, i32* %arrayidx8, align 4, !dbg !89
  %19 = load i32*, i32** %data3, align 8, !dbg !90
  call void @printWLine(i32* %19), !dbg !91
  %20 = load i32*, i32** %data3, align 8, !dbg !92
  %21 = bitcast i32* %20 to i8*, !dbg !92
  call void @free(i8* %21) #7, !dbg !93
  ret void, !dbg !94
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_32_good() #0 !dbg !95 {
entry:
  call void @goodG2B(), !dbg !96
  ret void, !dbg !97
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !98 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !104, metadata !DIExpression()), !dbg !105
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !106, metadata !DIExpression()), !dbg !107
  %call = call i64 @time(i64* null) #7, !dbg !108
  %conv = trunc i64 %call to i32, !dbg !109
  call void @srand(i32 %conv) #7, !dbg !110
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !111
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_32_good(), !dbg !112
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !113
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !114
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_32_bad(), !dbg !115
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !116
  ret i32 0, !dbg !117
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #6

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !118 {
entry:
  %data = alloca i32*, align 8
  %dataPtr1 = alloca i32**, align 8
  %dataPtr2 = alloca i32**, align 8
  %data1 = alloca i32*, align 8
  %data3 = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !119, metadata !DIExpression()), !dbg !120
  call void @llvm.dbg.declare(metadata i32*** %dataPtr1, metadata !121, metadata !DIExpression()), !dbg !122
  store i32** %data, i32*** %dataPtr1, align 8, !dbg !122
  call void @llvm.dbg.declare(metadata i32*** %dataPtr2, metadata !123, metadata !DIExpression()), !dbg !124
  store i32** %data, i32*** %dataPtr2, align 8, !dbg !124
  %call = call noalias align 16 i8* @malloc(i64 400) #7, !dbg !125
  %0 = bitcast i8* %call to i32*, !dbg !126
  store i32* %0, i32** %data, align 8, !dbg !127
  %1 = load i32*, i32** %data, align 8, !dbg !128
  %cmp = icmp eq i32* %1, null, !dbg !130
  br i1 %cmp, label %if.then, label %if.end, !dbg !131

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !132
  unreachable, !dbg !132

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !134, metadata !DIExpression()), !dbg !136
  %2 = load i32**, i32*** %dataPtr1, align 8, !dbg !137
  %3 = load i32*, i32** %2, align 8, !dbg !138
  store i32* %3, i32** %data1, align 8, !dbg !136
  %4 = load i32*, i32** %data1, align 8, !dbg !139
  %call2 = call i32* @wmemset(i32* %4, i32 65, i64 49) #7, !dbg !140
  %5 = load i32*, i32** %data1, align 8, !dbg !141
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 49, !dbg !141
  store i32 0, i32* %arrayidx, align 4, !dbg !142
  %6 = load i32*, i32** %data1, align 8, !dbg !143
  %7 = load i32**, i32*** %dataPtr1, align 8, !dbg !144
  store i32* %6, i32** %7, align 8, !dbg !145
  call void @llvm.dbg.declare(metadata i32** %data3, metadata !146, metadata !DIExpression()), !dbg !148
  %8 = load i32**, i32*** %dataPtr2, align 8, !dbg !149
  %9 = load i32*, i32** %8, align 8, !dbg !150
  store i32* %9, i32** %data3, align 8, !dbg !148
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !151, metadata !DIExpression()), !dbg !153
  %10 = bitcast [50 x i32]* %dest to i8*, !dbg !153
  call void @llvm.memset.p0i8.i64(i8* align 16 %10, i8 0, i64 200, i1 false), !dbg !153
  call void @llvm.dbg.declare(metadata i64* %i, metadata !154, metadata !DIExpression()), !dbg !155
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !156, metadata !DIExpression()), !dbg !157
  %11 = load i32*, i32** %data3, align 8, !dbg !158
  %call4 = call i64 @wcslen(i32* %11) #9, !dbg !159
  store i64 %call4, i64* %dataLen, align 8, !dbg !160
  store i64 0, i64* %i, align 8, !dbg !161
  br label %for.cond, !dbg !163

for.cond:                                         ; preds = %for.inc, %if.end
  %12 = load i64, i64* %i, align 8, !dbg !164
  %13 = load i64, i64* %dataLen, align 8, !dbg !166
  %cmp5 = icmp ult i64 %12, %13, !dbg !167
  br i1 %cmp5, label %for.body, label %for.end, !dbg !168

for.body:                                         ; preds = %for.cond
  %14 = load i32*, i32** %data3, align 8, !dbg !169
  %15 = load i64, i64* %i, align 8, !dbg !171
  %arrayidx6 = getelementptr inbounds i32, i32* %14, i64 %15, !dbg !169
  %16 = load i32, i32* %arrayidx6, align 4, !dbg !169
  %17 = load i64, i64* %i, align 8, !dbg !172
  %arrayidx7 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %17, !dbg !173
  store i32 %16, i32* %arrayidx7, align 4, !dbg !174
  br label %for.inc, !dbg !175

for.inc:                                          ; preds = %for.body
  %18 = load i64, i64* %i, align 8, !dbg !176
  %inc = add i64 %18, 1, !dbg !176
  store i64 %inc, i64* %i, align 8, !dbg !176
  br label %for.cond, !dbg !177, !llvm.loop !178

for.end:                                          ; preds = %for.cond
  %arrayidx8 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !180
  store i32 0, i32* %arrayidx8, align 4, !dbg !181
  %19 = load i32*, i32** %data3, align 8, !dbg !182
  call void @printWLine(i32* %19), !dbg !183
  %20 = load i32*, i32** %data3, align 8, !dbg !184
  %21 = bitcast i32* %20 to i8*, !dbg !184
  call void @free(i8* %21) #7, !dbg !185
  ret void, !dbg !186
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_32.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !8, !9}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !6, line: 74, baseType: !7)
!6 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!9 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!10 = !{i32 7, !"Dwarf Version", i32 4}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{i32 7, !"uwtable", i32 1}
!14 = !{i32 7, !"frame-pointer", i32 2}
!15 = !{!"clang version 13.0.0"}
!16 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_32_bad", scope: !17, file: !17, line: 23, type: !18, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_32.c", directory: "/home/joelyang/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 25, type: !4)
!21 = !DILocation(line: 25, column: 15, scope: !16)
!22 = !DILocalVariable(name: "dataPtr1", scope: !16, file: !17, line: 26, type: !23)
!23 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!24 = !DILocation(line: 26, column: 16, scope: !16)
!25 = !DILocalVariable(name: "dataPtr2", scope: !16, file: !17, line: 27, type: !23)
!26 = !DILocation(line: 27, column: 16, scope: !16)
!27 = !DILocation(line: 28, column: 23, scope: !16)
!28 = !DILocation(line: 28, column: 12, scope: !16)
!29 = !DILocation(line: 28, column: 10, scope: !16)
!30 = !DILocation(line: 29, column: 9, scope: !31)
!31 = distinct !DILexicalBlock(scope: !16, file: !17, line: 29, column: 9)
!32 = !DILocation(line: 29, column: 14, scope: !31)
!33 = !DILocation(line: 29, column: 9, scope: !16)
!34 = !DILocation(line: 29, column: 24, scope: !35)
!35 = distinct !DILexicalBlock(scope: !31, file: !17, line: 29, column: 23)
!36 = !DILocalVariable(name: "data", scope: !37, file: !17, line: 31, type: !4)
!37 = distinct !DILexicalBlock(scope: !16, file: !17, line: 30, column: 5)
!38 = !DILocation(line: 31, column: 19, scope: !37)
!39 = !DILocation(line: 31, column: 27, scope: !37)
!40 = !DILocation(line: 31, column: 26, scope: !37)
!41 = !DILocation(line: 33, column: 17, scope: !37)
!42 = !DILocation(line: 33, column: 9, scope: !37)
!43 = !DILocation(line: 34, column: 9, scope: !37)
!44 = !DILocation(line: 34, column: 21, scope: !37)
!45 = !DILocation(line: 35, column: 21, scope: !37)
!46 = !DILocation(line: 35, column: 10, scope: !37)
!47 = !DILocation(line: 35, column: 19, scope: !37)
!48 = !DILocalVariable(name: "data", scope: !49, file: !17, line: 38, type: !4)
!49 = distinct !DILexicalBlock(scope: !16, file: !17, line: 37, column: 5)
!50 = !DILocation(line: 38, column: 19, scope: !49)
!51 = !DILocation(line: 38, column: 27, scope: !49)
!52 = !DILocation(line: 38, column: 26, scope: !49)
!53 = !DILocalVariable(name: "dest", scope: !54, file: !17, line: 40, type: !55)
!54 = distinct !DILexicalBlock(scope: !49, file: !17, line: 39, column: 9)
!55 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 1600, elements: !56)
!56 = !{!57}
!57 = !DISubrange(count: 50)
!58 = !DILocation(line: 40, column: 21, scope: !54)
!59 = !DILocalVariable(name: "i", scope: !54, file: !17, line: 41, type: !60)
!60 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !6, line: 46, baseType: !61)
!61 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!62 = !DILocation(line: 41, column: 20, scope: !54)
!63 = !DILocalVariable(name: "dataLen", scope: !54, file: !17, line: 41, type: !60)
!64 = !DILocation(line: 41, column: 23, scope: !54)
!65 = !DILocation(line: 42, column: 30, scope: !54)
!66 = !DILocation(line: 42, column: 23, scope: !54)
!67 = !DILocation(line: 42, column: 21, scope: !54)
!68 = !DILocation(line: 44, column: 20, scope: !69)
!69 = distinct !DILexicalBlock(scope: !54, file: !17, line: 44, column: 13)
!70 = !DILocation(line: 44, column: 18, scope: !69)
!71 = !DILocation(line: 44, column: 25, scope: !72)
!72 = distinct !DILexicalBlock(scope: !69, file: !17, line: 44, column: 13)
!73 = !DILocation(line: 44, column: 29, scope: !72)
!74 = !DILocation(line: 44, column: 27, scope: !72)
!75 = !DILocation(line: 44, column: 13, scope: !69)
!76 = !DILocation(line: 46, column: 27, scope: !77)
!77 = distinct !DILexicalBlock(scope: !72, file: !17, line: 45, column: 13)
!78 = !DILocation(line: 46, column: 32, scope: !77)
!79 = !DILocation(line: 46, column: 22, scope: !77)
!80 = !DILocation(line: 46, column: 17, scope: !77)
!81 = !DILocation(line: 46, column: 25, scope: !77)
!82 = !DILocation(line: 47, column: 13, scope: !77)
!83 = !DILocation(line: 44, column: 39, scope: !72)
!84 = !DILocation(line: 44, column: 13, scope: !72)
!85 = distinct !{!85, !75, !86, !87}
!86 = !DILocation(line: 47, column: 13, scope: !69)
!87 = !{!"llvm.loop.mustprogress"}
!88 = !DILocation(line: 48, column: 13, scope: !54)
!89 = !DILocation(line: 48, column: 24, scope: !54)
!90 = !DILocation(line: 49, column: 24, scope: !54)
!91 = !DILocation(line: 49, column: 13, scope: !54)
!92 = !DILocation(line: 50, column: 18, scope: !54)
!93 = !DILocation(line: 50, column: 13, scope: !54)
!94 = !DILocation(line: 53, column: 1, scope: !16)
!95 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_32_good", scope: !17, file: !17, line: 92, type: !18, scopeLine: 93, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!96 = !DILocation(line: 94, column: 5, scope: !95)
!97 = !DILocation(line: 95, column: 1, scope: !95)
!98 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 106, type: !99, scopeLine: 107, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!99 = !DISubroutineType(types: !100)
!100 = !{!7, !7, !101}
!101 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !102, size: 64)
!102 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !103, size: 64)
!103 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!104 = !DILocalVariable(name: "argc", arg: 1, scope: !98, file: !17, line: 106, type: !7)
!105 = !DILocation(line: 106, column: 14, scope: !98)
!106 = !DILocalVariable(name: "argv", arg: 2, scope: !98, file: !17, line: 106, type: !101)
!107 = !DILocation(line: 106, column: 27, scope: !98)
!108 = !DILocation(line: 109, column: 22, scope: !98)
!109 = !DILocation(line: 109, column: 12, scope: !98)
!110 = !DILocation(line: 109, column: 5, scope: !98)
!111 = !DILocation(line: 111, column: 5, scope: !98)
!112 = !DILocation(line: 112, column: 5, scope: !98)
!113 = !DILocation(line: 113, column: 5, scope: !98)
!114 = !DILocation(line: 116, column: 5, scope: !98)
!115 = !DILocation(line: 117, column: 5, scope: !98)
!116 = !DILocation(line: 118, column: 5, scope: !98)
!117 = !DILocation(line: 120, column: 5, scope: !98)
!118 = distinct !DISubprogram(name: "goodG2B", scope: !17, file: !17, line: 60, type: !18, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!119 = !DILocalVariable(name: "data", scope: !118, file: !17, line: 62, type: !4)
!120 = !DILocation(line: 62, column: 15, scope: !118)
!121 = !DILocalVariable(name: "dataPtr1", scope: !118, file: !17, line: 63, type: !23)
!122 = !DILocation(line: 63, column: 16, scope: !118)
!123 = !DILocalVariable(name: "dataPtr2", scope: !118, file: !17, line: 64, type: !23)
!124 = !DILocation(line: 64, column: 16, scope: !118)
!125 = !DILocation(line: 65, column: 23, scope: !118)
!126 = !DILocation(line: 65, column: 12, scope: !118)
!127 = !DILocation(line: 65, column: 10, scope: !118)
!128 = !DILocation(line: 66, column: 9, scope: !129)
!129 = distinct !DILexicalBlock(scope: !118, file: !17, line: 66, column: 9)
!130 = !DILocation(line: 66, column: 14, scope: !129)
!131 = !DILocation(line: 66, column: 9, scope: !118)
!132 = !DILocation(line: 66, column: 24, scope: !133)
!133 = distinct !DILexicalBlock(scope: !129, file: !17, line: 66, column: 23)
!134 = !DILocalVariable(name: "data", scope: !135, file: !17, line: 68, type: !4)
!135 = distinct !DILexicalBlock(scope: !118, file: !17, line: 67, column: 5)
!136 = !DILocation(line: 68, column: 19, scope: !135)
!137 = !DILocation(line: 68, column: 27, scope: !135)
!138 = !DILocation(line: 68, column: 26, scope: !135)
!139 = !DILocation(line: 70, column: 17, scope: !135)
!140 = !DILocation(line: 70, column: 9, scope: !135)
!141 = !DILocation(line: 71, column: 9, scope: !135)
!142 = !DILocation(line: 71, column: 20, scope: !135)
!143 = !DILocation(line: 72, column: 21, scope: !135)
!144 = !DILocation(line: 72, column: 10, scope: !135)
!145 = !DILocation(line: 72, column: 19, scope: !135)
!146 = !DILocalVariable(name: "data", scope: !147, file: !17, line: 75, type: !4)
!147 = distinct !DILexicalBlock(scope: !118, file: !17, line: 74, column: 5)
!148 = !DILocation(line: 75, column: 19, scope: !147)
!149 = !DILocation(line: 75, column: 27, scope: !147)
!150 = !DILocation(line: 75, column: 26, scope: !147)
!151 = !DILocalVariable(name: "dest", scope: !152, file: !17, line: 77, type: !55)
!152 = distinct !DILexicalBlock(scope: !147, file: !17, line: 76, column: 9)
!153 = !DILocation(line: 77, column: 21, scope: !152)
!154 = !DILocalVariable(name: "i", scope: !152, file: !17, line: 78, type: !60)
!155 = !DILocation(line: 78, column: 20, scope: !152)
!156 = !DILocalVariable(name: "dataLen", scope: !152, file: !17, line: 78, type: !60)
!157 = !DILocation(line: 78, column: 23, scope: !152)
!158 = !DILocation(line: 79, column: 30, scope: !152)
!159 = !DILocation(line: 79, column: 23, scope: !152)
!160 = !DILocation(line: 79, column: 21, scope: !152)
!161 = !DILocation(line: 81, column: 20, scope: !162)
!162 = distinct !DILexicalBlock(scope: !152, file: !17, line: 81, column: 13)
!163 = !DILocation(line: 81, column: 18, scope: !162)
!164 = !DILocation(line: 81, column: 25, scope: !165)
!165 = distinct !DILexicalBlock(scope: !162, file: !17, line: 81, column: 13)
!166 = !DILocation(line: 81, column: 29, scope: !165)
!167 = !DILocation(line: 81, column: 27, scope: !165)
!168 = !DILocation(line: 81, column: 13, scope: !162)
!169 = !DILocation(line: 83, column: 27, scope: !170)
!170 = distinct !DILexicalBlock(scope: !165, file: !17, line: 82, column: 13)
!171 = !DILocation(line: 83, column: 32, scope: !170)
!172 = !DILocation(line: 83, column: 22, scope: !170)
!173 = !DILocation(line: 83, column: 17, scope: !170)
!174 = !DILocation(line: 83, column: 25, scope: !170)
!175 = !DILocation(line: 84, column: 13, scope: !170)
!176 = !DILocation(line: 81, column: 39, scope: !165)
!177 = !DILocation(line: 81, column: 13, scope: !165)
!178 = distinct !{!178, !168, !179, !87}
!179 = !DILocation(line: 84, column: 13, scope: !162)
!180 = !DILocation(line: 85, column: 13, scope: !152)
!181 = !DILocation(line: 85, column: 24, scope: !152)
!182 = !DILocation(line: 86, column: 24, scope: !152)
!183 = !DILocation(line: 86, column: 13, scope: !152)
!184 = !DILocation(line: 87, column: 18, scope: !152)
!185 = !DILocation(line: 87, column: 13, scope: !152)
!186 = !DILocation(line: 90, column: 1, scope: !118)
