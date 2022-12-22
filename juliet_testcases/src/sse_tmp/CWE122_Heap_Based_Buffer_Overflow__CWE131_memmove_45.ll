; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE131_memmove_45.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE131_memmove_45.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE122_Heap_Based_Buffer_Overflow__CWE131_memmove_45_badData = internal global i32* null, align 8, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@CWE122_Heap_Based_Buffer_Overflow__CWE131_memmove_45_goodG2BData = internal global i32* null, align 8, !dbg !11

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__CWE131_memmove_45_bad() #0 !dbg !20 {
entry:
  %data = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !23, metadata !DIExpression()), !dbg !24
  store i32* null, i32** %data, align 8, !dbg !25
  %call = call noalias align 16 i8* @malloc(i64 10) #7, !dbg !26
  %0 = bitcast i8* %call to i32*, !dbg !27
  store i32* %0, i32** %data, align 8, !dbg !28
  %1 = load i32*, i32** %data, align 8, !dbg !29
  %cmp = icmp eq i32* %1, null, !dbg !31
  br i1 %cmp, label %if.then, label %if.end, !dbg !32

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !33
  unreachable, !dbg !33

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !35
  store i32* %2, i32** @CWE122_Heap_Based_Buffer_Overflow__CWE131_memmove_45_badData, align 8, !dbg !36
  call void @badSink(), !dbg !37
  ret void, !dbg !38
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__CWE131_memmove_45_good() #0 !dbg !39 {
entry:
  call void @goodG2B(), !dbg !40
  ret void, !dbg !41
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !42 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !48, metadata !DIExpression()), !dbg !49
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !50, metadata !DIExpression()), !dbg !51
  %call = call i64 @time(i64* null) #7, !dbg !52
  %conv = trunc i64 %call to i32, !dbg !53
  call void @srand(i32 %conv) #7, !dbg !54
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !55
  call void @CWE122_Heap_Based_Buffer_Overflow__CWE131_memmove_45_good(), !dbg !56
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !57
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !58
  call void @CWE122_Heap_Based_Buffer_Overflow__CWE131_memmove_45_bad(), !dbg !59
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !60
  ret i32 0, !dbg !61
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @badSink() #0 !dbg !62 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !63, metadata !DIExpression()), !dbg !64
  %0 = load i32*, i32** @CWE122_Heap_Based_Buffer_Overflow__CWE131_memmove_45_badData, align 8, !dbg !65
  store i32* %0, i32** %data, align 8, !dbg !64
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !66, metadata !DIExpression()), !dbg !71
  %1 = bitcast [10 x i32]* %source to i8*, !dbg !71
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !71
  %2 = load i32*, i32** %data, align 8, !dbg !72
  %3 = bitcast i32* %2 to i8*, !dbg !73
  %arraydecay = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 0, !dbg !73
  %4 = bitcast i32* %arraydecay to i8*, !dbg !73
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %3, i8* align 16 %4, i64 40, i1 false), !dbg !73
  %5 = load i32*, i32** %data, align 8, !dbg !74
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !74
  %6 = load i32, i32* %arrayidx, align 4, !dbg !74
  call void @printIntLine(i32 %6), !dbg !75
  %7 = load i32*, i32** %data, align 8, !dbg !76
  %8 = bitcast i32* %7 to i8*, !dbg !76
  call void @free(i8* %8) #7, !dbg !77
  ret void, !dbg !78
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #5

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #6

declare dso_local void @printIntLine(i32) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !79 {
entry:
  %data = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !80, metadata !DIExpression()), !dbg !81
  store i32* null, i32** %data, align 8, !dbg !82
  %call = call noalias align 16 i8* @malloc(i64 40) #7, !dbg !83
  %0 = bitcast i8* %call to i32*, !dbg !84
  store i32* %0, i32** %data, align 8, !dbg !85
  %1 = load i32*, i32** %data, align 8, !dbg !86
  %cmp = icmp eq i32* %1, null, !dbg !88
  br i1 %cmp, label %if.then, label %if.end, !dbg !89

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !90
  unreachable, !dbg !90

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !92
  store i32* %2, i32** @CWE122_Heap_Based_Buffer_Overflow__CWE131_memmove_45_goodG2BData, align 8, !dbg !93
  call void @goodG2BSink(), !dbg !94
  ret void, !dbg !95
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink() #0 !dbg !96 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !97, metadata !DIExpression()), !dbg !98
  %0 = load i32*, i32** @CWE122_Heap_Based_Buffer_Overflow__CWE131_memmove_45_goodG2BData, align 8, !dbg !99
  store i32* %0, i32** %data, align 8, !dbg !98
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !100, metadata !DIExpression()), !dbg !102
  %1 = bitcast [10 x i32]* %source to i8*, !dbg !102
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !102
  %2 = load i32*, i32** %data, align 8, !dbg !103
  %3 = bitcast i32* %2 to i8*, !dbg !104
  %arraydecay = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 0, !dbg !104
  %4 = bitcast i32* %arraydecay to i8*, !dbg !104
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %3, i8* align 16 %4, i64 40, i1 false), !dbg !104
  %5 = load i32*, i32** %data, align 8, !dbg !105
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !105
  %6 = load i32, i32* %arrayidx, align 4, !dbg !105
  call void @printIntLine(i32 %6), !dbg !106
  %7 = load i32*, i32** %data, align 8, !dbg !107
  %8 = bitcast i32* %7 to i8*, !dbg !107
  call void @free(i8* %8) #7, !dbg !108
  ret void, !dbg !109
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { argmemonly nofree nounwind willreturn writeonly }
attributes #6 = { argmemonly nofree nounwind willreturn }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!14, !15, !16, !17, !18}
!llvm.ident = !{!19}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__CWE131_memmove_45_badData", scope: !2, file: !13, line: 19, type: !6, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !10, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE131_memmove_45.c", directory: "/root/SSE-Assessment")
!4 = !{}
!5 = !{!6, !8, !9}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!9 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!10 = !{!0, !11}
!11 = !DIGlobalVariableExpression(var: !12, expr: !DIExpression())
!12 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__CWE131_memmove_45_goodG2BData", scope: !2, file: !13, line: 20, type: !6, isLocal: true, isDefinition: true)
!13 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE131_memmove_45.c", directory: "/root/SSE-Assessment")
!14 = !{i32 7, !"Dwarf Version", i32 4}
!15 = !{i32 2, !"Debug Info Version", i32 3}
!16 = !{i32 1, !"wchar_size", i32 4}
!17 = !{i32 7, !"uwtable", i32 1}
!18 = !{i32 7, !"frame-pointer", i32 2}
!19 = !{!"clang version 13.0.0"}
!20 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__CWE131_memmove_45_bad", scope: !13, file: !13, line: 36, type: !21, scopeLine: 37, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !DILocalVariable(name: "data", scope: !20, file: !13, line: 38, type: !6)
!24 = !DILocation(line: 38, column: 11, scope: !20)
!25 = !DILocation(line: 39, column: 10, scope: !20)
!26 = !DILocation(line: 41, column: 19, scope: !20)
!27 = !DILocation(line: 41, column: 12, scope: !20)
!28 = !DILocation(line: 41, column: 10, scope: !20)
!29 = !DILocation(line: 42, column: 9, scope: !30)
!30 = distinct !DILexicalBlock(scope: !20, file: !13, line: 42, column: 9)
!31 = !DILocation(line: 42, column: 14, scope: !30)
!32 = !DILocation(line: 42, column: 9, scope: !20)
!33 = !DILocation(line: 42, column: 24, scope: !34)
!34 = distinct !DILexicalBlock(scope: !30, file: !13, line: 42, column: 23)
!35 = !DILocation(line: 43, column: 68, scope: !20)
!36 = !DILocation(line: 43, column: 66, scope: !20)
!37 = !DILocation(line: 44, column: 5, scope: !20)
!38 = !DILocation(line: 45, column: 1, scope: !20)
!39 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__CWE131_memmove_45_good", scope: !13, file: !13, line: 75, type: !21, scopeLine: 76, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!40 = !DILocation(line: 77, column: 5, scope: !39)
!41 = !DILocation(line: 78, column: 1, scope: !39)
!42 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 89, type: !43, scopeLine: 90, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!43 = !DISubroutineType(types: !44)
!44 = !{!7, !7, !45}
!45 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !46, size: 64)
!46 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !47, size: 64)
!47 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!48 = !DILocalVariable(name: "argc", arg: 1, scope: !42, file: !13, line: 89, type: !7)
!49 = !DILocation(line: 89, column: 14, scope: !42)
!50 = !DILocalVariable(name: "argv", arg: 2, scope: !42, file: !13, line: 89, type: !45)
!51 = !DILocation(line: 89, column: 27, scope: !42)
!52 = !DILocation(line: 92, column: 22, scope: !42)
!53 = !DILocation(line: 92, column: 12, scope: !42)
!54 = !DILocation(line: 92, column: 5, scope: !42)
!55 = !DILocation(line: 94, column: 5, scope: !42)
!56 = !DILocation(line: 95, column: 5, scope: !42)
!57 = !DILocation(line: 96, column: 5, scope: !42)
!58 = !DILocation(line: 99, column: 5, scope: !42)
!59 = !DILocation(line: 100, column: 5, scope: !42)
!60 = !DILocation(line: 101, column: 5, scope: !42)
!61 = !DILocation(line: 103, column: 5, scope: !42)
!62 = distinct !DISubprogram(name: "badSink", scope: !13, file: !13, line: 24, type: !21, scopeLine: 25, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!63 = !DILocalVariable(name: "data", scope: !62, file: !13, line: 26, type: !6)
!64 = !DILocation(line: 26, column: 11, scope: !62)
!65 = !DILocation(line: 26, column: 18, scope: !62)
!66 = !DILocalVariable(name: "source", scope: !67, file: !13, line: 28, type: !68)
!67 = distinct !DILexicalBlock(scope: !62, file: !13, line: 27, column: 5)
!68 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 320, elements: !69)
!69 = !{!70}
!70 = !DISubrange(count: 10)
!71 = !DILocation(line: 28, column: 13, scope: !67)
!72 = !DILocation(line: 30, column: 17, scope: !67)
!73 = !DILocation(line: 30, column: 9, scope: !67)
!74 = !DILocation(line: 31, column: 22, scope: !67)
!75 = !DILocation(line: 31, column: 9, scope: !67)
!76 = !DILocation(line: 32, column: 14, scope: !67)
!77 = !DILocation(line: 32, column: 9, scope: !67)
!78 = !DILocation(line: 34, column: 1, scope: !62)
!79 = distinct !DISubprogram(name: "goodG2B", scope: !13, file: !13, line: 64, type: !21, scopeLine: 65, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!80 = !DILocalVariable(name: "data", scope: !79, file: !13, line: 66, type: !6)
!81 = !DILocation(line: 66, column: 11, scope: !79)
!82 = !DILocation(line: 67, column: 10, scope: !79)
!83 = !DILocation(line: 69, column: 19, scope: !79)
!84 = !DILocation(line: 69, column: 12, scope: !79)
!85 = !DILocation(line: 69, column: 10, scope: !79)
!86 = !DILocation(line: 70, column: 9, scope: !87)
!87 = distinct !DILexicalBlock(scope: !79, file: !13, line: 70, column: 9)
!88 = !DILocation(line: 70, column: 14, scope: !87)
!89 = !DILocation(line: 70, column: 9, scope: !79)
!90 = !DILocation(line: 70, column: 24, scope: !91)
!91 = distinct !DILexicalBlock(scope: !87, file: !13, line: 70, column: 23)
!92 = !DILocation(line: 71, column: 72, scope: !79)
!93 = !DILocation(line: 71, column: 70, scope: !79)
!94 = !DILocation(line: 72, column: 5, scope: !79)
!95 = !DILocation(line: 73, column: 1, scope: !79)
!96 = distinct !DISubprogram(name: "goodG2BSink", scope: !13, file: !13, line: 52, type: !21, scopeLine: 53, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!97 = !DILocalVariable(name: "data", scope: !96, file: !13, line: 54, type: !6)
!98 = !DILocation(line: 54, column: 11, scope: !96)
!99 = !DILocation(line: 54, column: 18, scope: !96)
!100 = !DILocalVariable(name: "source", scope: !101, file: !13, line: 56, type: !68)
!101 = distinct !DILexicalBlock(scope: !96, file: !13, line: 55, column: 5)
!102 = !DILocation(line: 56, column: 13, scope: !101)
!103 = !DILocation(line: 58, column: 17, scope: !101)
!104 = !DILocation(line: 58, column: 9, scope: !101)
!105 = !DILocation(line: 59, column: 22, scope: !101)
!106 = !DILocation(line: 59, column: 9, scope: !101)
!107 = !DILocation(line: 60, column: 14, scope: !101)
!108 = !DILocation(line: 60, column: 9, scope: !101)
!109 = !DILocation(line: 62, column: 1, scope: !96)
