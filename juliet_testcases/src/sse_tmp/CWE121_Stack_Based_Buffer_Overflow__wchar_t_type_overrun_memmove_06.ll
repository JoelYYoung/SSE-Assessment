; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__wchar_t_type_overrun_memmove_06.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__wchar_t_type_overrun_memmove_06.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._charVoid = type { [16 x i32], i8*, i8* }

@.str = private unnamed_addr constant [32 x i32] [i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 97, i32 98, i32 99, i32 100, i32 101, i32 102, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 97, i32 98, i32 99, i32 100, i32 101, i32 0], align 4
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__wchar_t_type_overrun_memmove_06_bad() #0 !dbg !16 {
entry:
  %structCharVoid = alloca %struct._charVoid, align 8
  call void @llvm.dbg.declare(metadata %struct._charVoid* %structCharVoid, metadata !20, metadata !DIExpression()), !dbg !33
  %voidSecond = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 1, !dbg !34
  store i8* bitcast ([32 x i32]* @.str to i8*), i8** %voidSecond, align 8, !dbg !35
  %voidSecond1 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 1, !dbg !36
  %0 = load i8*, i8** %voidSecond1, align 8, !dbg !36
  %1 = bitcast i8* %0 to i32*, !dbg !37
  call void @printWLine(i32* %1), !dbg !38
  %charFirst = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 0, !dbg !39
  %arraydecay = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst, i64 0, i64 0, !dbg !40
  %2 = bitcast i32* %arraydecay to i8*, !dbg !40
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 8 %2, i8* align 4 bitcast ([32 x i32]* @.str to i8*), i64 80, i1 false), !dbg !40
  %charFirst2 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 0, !dbg !41
  %arrayidx = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst2, i64 0, i64 15, !dbg !42
  store i32 0, i32* %arrayidx, align 4, !dbg !43
  %charFirst3 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 0, !dbg !44
  %arraydecay4 = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst3, i64 0, i64 0, !dbg !45
  call void @printWLine(i32* %arraydecay4), !dbg !46
  %voidSecond5 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 1, !dbg !47
  %3 = load i8*, i8** %voidSecond5, align 8, !dbg !47
  %4 = bitcast i8* %3 to i32*, !dbg !48
  call void @printWLine(i32* %4), !dbg !49
  ret void, !dbg !50
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local void @printWLine(i32*) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__wchar_t_type_overrun_memmove_06_good() #0 !dbg !51 {
entry:
  call void @good1(), !dbg !52
  call void @good2(), !dbg !53
  ret void, !dbg !54
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !55 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !61, metadata !DIExpression()), !dbg !62
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !63, metadata !DIExpression()), !dbg !64
  %call = call i64 @time(i64* null) #5, !dbg !65
  %conv = trunc i64 %call to i32, !dbg !66
  call void @srand(i32 %conv) #5, !dbg !67
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !68
  call void @CWE121_Stack_Based_Buffer_Overflow__wchar_t_type_overrun_memmove_06_good(), !dbg !69
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !71
  call void @CWE121_Stack_Based_Buffer_Overflow__wchar_t_type_overrun_memmove_06_bad(), !dbg !72
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !73
  ret i32 0, !dbg !74
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @good1() #0 !dbg !75 {
entry:
  %structCharVoid = alloca %struct._charVoid, align 8
  call void @llvm.dbg.declare(metadata %struct._charVoid* %structCharVoid, metadata !76, metadata !DIExpression()), !dbg !80
  %voidSecond = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 1, !dbg !81
  store i8* bitcast ([32 x i32]* @.str to i8*), i8** %voidSecond, align 8, !dbg !82
  %voidSecond1 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 1, !dbg !83
  %0 = load i8*, i8** %voidSecond1, align 8, !dbg !83
  %1 = bitcast i8* %0 to i32*, !dbg !84
  call void @printWLine(i32* %1), !dbg !85
  %charFirst = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 0, !dbg !86
  %arraydecay = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst, i64 0, i64 0, !dbg !87
  %2 = bitcast i32* %arraydecay to i8*, !dbg !87
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 8 %2, i8* align 4 bitcast ([32 x i32]* @.str to i8*), i64 64, i1 false), !dbg !87
  %charFirst2 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 0, !dbg !88
  %arrayidx = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst2, i64 0, i64 15, !dbg !89
  store i32 0, i32* %arrayidx, align 4, !dbg !90
  %charFirst3 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 0, !dbg !91
  %arraydecay4 = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst3, i64 0, i64 0, !dbg !92
  call void @printWLine(i32* %arraydecay4), !dbg !93
  %voidSecond5 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 1, !dbg !94
  %3 = load i8*, i8** %voidSecond5, align 8, !dbg !94
  %4 = bitcast i8* %3 to i32*, !dbg !95
  call void @printWLine(i32* %4), !dbg !96
  ret void, !dbg !97
}

; Function Attrs: noinline nounwind uwtable
define internal void @good2() #0 !dbg !98 {
entry:
  %structCharVoid = alloca %struct._charVoid, align 8
  call void @llvm.dbg.declare(metadata %struct._charVoid* %structCharVoid, metadata !99, metadata !DIExpression()), !dbg !103
  %voidSecond = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 1, !dbg !104
  store i8* bitcast ([32 x i32]* @.str to i8*), i8** %voidSecond, align 8, !dbg !105
  %voidSecond1 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 1, !dbg !106
  %0 = load i8*, i8** %voidSecond1, align 8, !dbg !106
  %1 = bitcast i8* %0 to i32*, !dbg !107
  call void @printWLine(i32* %1), !dbg !108
  %charFirst = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 0, !dbg !109
  %arraydecay = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst, i64 0, i64 0, !dbg !110
  %2 = bitcast i32* %arraydecay to i8*, !dbg !110
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 8 %2, i8* align 4 bitcast ([32 x i32]* @.str to i8*), i64 64, i1 false), !dbg !110
  %charFirst2 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 0, !dbg !111
  %arrayidx = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst2, i64 0, i64 15, !dbg !112
  store i32 0, i32* %arrayidx, align 4, !dbg !113
  %charFirst3 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 0, !dbg !114
  %arraydecay4 = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst3, i64 0, i64 0, !dbg !115
  call void @printWLine(i32* %arraydecay4), !dbg !116
  %voidSecond5 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 1, !dbg !117
  %3 = load i8*, i8** %voidSecond5, align 8, !dbg !117
  %4 = bitcast i8* %3 to i32*, !dbg !118
  call void @printWLine(i32* %4), !dbg !119
  ret void, !dbg !120
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__wchar_t_type_overrun_memmove_06.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !5, !9}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !7, line: 74, baseType: !8)
!7 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!8 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!9 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!10 = !{i32 7, !"Dwarf Version", i32 4}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{i32 7, !"uwtable", i32 1}
!14 = !{i32 7, !"frame-pointer", i32 2}
!15 = !{!"clang version 13.0.0"}
!16 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__wchar_t_type_overrun_memmove_06_bad", scope: !17, file: !17, line: 39, type: !18, scopeLine: 40, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__wchar_t_type_overrun_memmove_06.c", directory: "/root/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "structCharVoid", scope: !21, file: !17, line: 44, type: !24)
!21 = distinct !DILexicalBlock(scope: !22, file: !17, line: 43, column: 9)
!22 = distinct !DILexicalBlock(scope: !23, file: !17, line: 42, column: 5)
!23 = distinct !DILexicalBlock(scope: !16, file: !17, line: 41, column: 8)
!24 = !DIDerivedType(tag: DW_TAG_typedef, name: "charVoid", file: !17, line: 30, baseType: !25)
!25 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_charVoid", file: !17, line: 25, size: 640, elements: !26)
!26 = !{!27, !31, !32}
!27 = !DIDerivedType(tag: DW_TAG_member, name: "charFirst", scope: !25, file: !17, line: 27, baseType: !28, size: 512)
!28 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 512, elements: !29)
!29 = !{!30}
!30 = !DISubrange(count: 16)
!31 = !DIDerivedType(tag: DW_TAG_member, name: "voidSecond", scope: !25, file: !17, line: 28, baseType: !4, size: 64, offset: 512)
!32 = !DIDerivedType(tag: DW_TAG_member, name: "voidThird", scope: !25, file: !17, line: 29, baseType: !4, size: 64, offset: 576)
!33 = !DILocation(line: 44, column: 22, scope: !21)
!34 = !DILocation(line: 45, column: 28, scope: !21)
!35 = !DILocation(line: 45, column: 39, scope: !21)
!36 = !DILocation(line: 47, column: 50, scope: !21)
!37 = !DILocation(line: 47, column: 24, scope: !21)
!38 = !DILocation(line: 47, column: 13, scope: !21)
!39 = !DILocation(line: 49, column: 36, scope: !21)
!40 = !DILocation(line: 49, column: 13, scope: !21)
!41 = !DILocation(line: 50, column: 28, scope: !21)
!42 = !DILocation(line: 50, column: 13, scope: !21)
!43 = !DILocation(line: 50, column: 92, scope: !21)
!44 = !DILocation(line: 51, column: 50, scope: !21)
!45 = !DILocation(line: 51, column: 35, scope: !21)
!46 = !DILocation(line: 51, column: 13, scope: !21)
!47 = !DILocation(line: 52, column: 50, scope: !21)
!48 = !DILocation(line: 52, column: 24, scope: !21)
!49 = !DILocation(line: 52, column: 13, scope: !21)
!50 = !DILocation(line: 55, column: 1, scope: !16)
!51 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__wchar_t_type_overrun_memmove_06_good", scope: !17, file: !17, line: 104, type: !18, scopeLine: 105, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!52 = !DILocation(line: 106, column: 5, scope: !51)
!53 = !DILocation(line: 107, column: 5, scope: !51)
!54 = !DILocation(line: 108, column: 1, scope: !51)
!55 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 119, type: !56, scopeLine: 120, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!56 = !DISubroutineType(types: !57)
!57 = !{!8, !8, !58}
!58 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !59, size: 64)
!59 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !60, size: 64)
!60 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!61 = !DILocalVariable(name: "argc", arg: 1, scope: !55, file: !17, line: 119, type: !8)
!62 = !DILocation(line: 119, column: 14, scope: !55)
!63 = !DILocalVariable(name: "argv", arg: 2, scope: !55, file: !17, line: 119, type: !58)
!64 = !DILocation(line: 119, column: 27, scope: !55)
!65 = !DILocation(line: 122, column: 22, scope: !55)
!66 = !DILocation(line: 122, column: 12, scope: !55)
!67 = !DILocation(line: 122, column: 5, scope: !55)
!68 = !DILocation(line: 124, column: 5, scope: !55)
!69 = !DILocation(line: 125, column: 5, scope: !55)
!70 = !DILocation(line: 126, column: 5, scope: !55)
!71 = !DILocation(line: 129, column: 5, scope: !55)
!72 = !DILocation(line: 130, column: 5, scope: !55)
!73 = !DILocation(line: 131, column: 5, scope: !55)
!74 = !DILocation(line: 133, column: 5, scope: !55)
!75 = distinct !DISubprogram(name: "good1", scope: !17, file: !17, line: 62, type: !18, scopeLine: 63, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!76 = !DILocalVariable(name: "structCharVoid", scope: !77, file: !17, line: 72, type: !24)
!77 = distinct !DILexicalBlock(scope: !78, file: !17, line: 71, column: 9)
!78 = distinct !DILexicalBlock(scope: !79, file: !17, line: 70, column: 5)
!79 = distinct !DILexicalBlock(scope: !75, file: !17, line: 64, column: 8)
!80 = !DILocation(line: 72, column: 22, scope: !77)
!81 = !DILocation(line: 73, column: 28, scope: !77)
!82 = !DILocation(line: 73, column: 39, scope: !77)
!83 = !DILocation(line: 75, column: 50, scope: !77)
!84 = !DILocation(line: 75, column: 24, scope: !77)
!85 = !DILocation(line: 75, column: 13, scope: !77)
!86 = !DILocation(line: 77, column: 36, scope: !77)
!87 = !DILocation(line: 77, column: 13, scope: !77)
!88 = !DILocation(line: 78, column: 28, scope: !77)
!89 = !DILocation(line: 78, column: 13, scope: !77)
!90 = !DILocation(line: 78, column: 92, scope: !77)
!91 = !DILocation(line: 79, column: 50, scope: !77)
!92 = !DILocation(line: 79, column: 35, scope: !77)
!93 = !DILocation(line: 79, column: 13, scope: !77)
!94 = !DILocation(line: 80, column: 50, scope: !77)
!95 = !DILocation(line: 80, column: 24, scope: !77)
!96 = !DILocation(line: 80, column: 13, scope: !77)
!97 = !DILocation(line: 83, column: 1, scope: !75)
!98 = distinct !DISubprogram(name: "good2", scope: !17, file: !17, line: 86, type: !18, scopeLine: 87, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!99 = !DILocalVariable(name: "structCharVoid", scope: !100, file: !17, line: 91, type: !24)
!100 = distinct !DILexicalBlock(scope: !101, file: !17, line: 90, column: 9)
!101 = distinct !DILexicalBlock(scope: !102, file: !17, line: 89, column: 5)
!102 = distinct !DILexicalBlock(scope: !98, file: !17, line: 88, column: 8)
!103 = !DILocation(line: 91, column: 22, scope: !100)
!104 = !DILocation(line: 92, column: 28, scope: !100)
!105 = !DILocation(line: 92, column: 39, scope: !100)
!106 = !DILocation(line: 94, column: 50, scope: !100)
!107 = !DILocation(line: 94, column: 24, scope: !100)
!108 = !DILocation(line: 94, column: 13, scope: !100)
!109 = !DILocation(line: 96, column: 36, scope: !100)
!110 = !DILocation(line: 96, column: 13, scope: !100)
!111 = !DILocation(line: 97, column: 28, scope: !100)
!112 = !DILocation(line: 97, column: 13, scope: !100)
!113 = !DILocation(line: 97, column: 92, scope: !100)
!114 = !DILocation(line: 98, column: 50, scope: !100)
!115 = !DILocation(line: 98, column: 35, scope: !100)
!116 = !DILocation(line: 98, column: 13, scope: !100)
!117 = !DILocation(line: 99, column: 50, scope: !100)
!118 = !DILocation(line: 99, column: 24, scope: !100)
!119 = !DILocation(line: 99, column: 13, scope: !100)
!120 = !DILocation(line: 102, column: 1, scope: !98)
