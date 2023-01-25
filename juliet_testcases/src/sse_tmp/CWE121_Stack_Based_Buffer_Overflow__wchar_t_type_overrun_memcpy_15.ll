; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__wchar_t_type_overrun_memcpy_15.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__wchar_t_type_overrun_memcpy_15.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._charVoid = type { [16 x i32], i8*, i8* }

@.str = private unnamed_addr constant [32 x i32] [i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 97, i32 98, i32 99, i32 100, i32 101, i32 102, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 97, i32 98, i32 99, i32 100, i32 101, i32 0], align 4
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__wchar_t_type_overrun_memcpy_15_bad() #0 !dbg !16 {
entry:
  %structCharVoid = alloca %struct._charVoid, align 8
  call void @llvm.dbg.declare(metadata %struct._charVoid* %structCharVoid, metadata !20, metadata !DIExpression()), !dbg !31
  %voidSecond = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 1, !dbg !32
  store i8* bitcast ([32 x i32]* @.str to i8*), i8** %voidSecond, align 8, !dbg !33
  %voidSecond1 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 1, !dbg !34
  %0 = load i8*, i8** %voidSecond1, align 8, !dbg !34
  %1 = bitcast i8* %0 to i32*, !dbg !35
  call void @printWLine(i32* %1), !dbg !36
  %charFirst = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 0, !dbg !37
  %arraydecay = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst, i64 0, i64 0, !dbg !38
  %2 = bitcast i32* %arraydecay to i8*, !dbg !38
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %2, i8* align 4 bitcast ([32 x i32]* @.str to i8*), i64 80, i1 false), !dbg !38
  %charFirst2 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 0, !dbg !39
  %arrayidx = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst2, i64 0, i64 15, !dbg !40
  store i32 0, i32* %arrayidx, align 4, !dbg !41
  %charFirst3 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 0, !dbg !42
  %arraydecay4 = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst3, i64 0, i64 0, !dbg !43
  call void @printWLine(i32* %arraydecay4), !dbg !44
  %voidSecond5 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 1, !dbg !45
  %3 = load i8*, i8** %voidSecond5, align 8, !dbg !45
  %4 = bitcast i8* %3 to i32*, !dbg !46
  call void @printWLine(i32* %4), !dbg !47
  ret void, !dbg !48
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local void @printWLine(i32*) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__wchar_t_type_overrun_memcpy_15_good() #0 !dbg !49 {
entry:
  call void @good1(), !dbg !50
  call void @good2(), !dbg !51
  ret void, !dbg !52
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !53 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !59, metadata !DIExpression()), !dbg !60
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !61, metadata !DIExpression()), !dbg !62
  %call = call i64 @time(i64* null) #5, !dbg !63
  %conv = trunc i64 %call to i32, !dbg !64
  call void @srand(i32 %conv) #5, !dbg !65
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !66
  call void @CWE121_Stack_Based_Buffer_Overflow__wchar_t_type_overrun_memcpy_15_good(), !dbg !67
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !68
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !69
  call void @CWE121_Stack_Based_Buffer_Overflow__wchar_t_type_overrun_memcpy_15_bad(), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !71
  ret i32 0, !dbg !72
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @good1() #0 !dbg !73 {
entry:
  %structCharVoid = alloca %struct._charVoid, align 8
  call void @llvm.dbg.declare(metadata %struct._charVoid* %structCharVoid, metadata !74, metadata !DIExpression()), !dbg !76
  %voidSecond = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 1, !dbg !77
  store i8* bitcast ([32 x i32]* @.str to i8*), i8** %voidSecond, align 8, !dbg !78
  %voidSecond1 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 1, !dbg !79
  %0 = load i8*, i8** %voidSecond1, align 8, !dbg !79
  %1 = bitcast i8* %0 to i32*, !dbg !80
  call void @printWLine(i32* %1), !dbg !81
  %charFirst = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 0, !dbg !82
  %arraydecay = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst, i64 0, i64 0, !dbg !83
  %2 = bitcast i32* %arraydecay to i8*, !dbg !83
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %2, i8* align 4 bitcast ([32 x i32]* @.str to i8*), i64 64, i1 false), !dbg !83
  %charFirst2 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 0, !dbg !84
  %arrayidx = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst2, i64 0, i64 15, !dbg !85
  store i32 0, i32* %arrayidx, align 4, !dbg !86
  %charFirst3 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 0, !dbg !87
  %arraydecay4 = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst3, i64 0, i64 0, !dbg !88
  call void @printWLine(i32* %arraydecay4), !dbg !89
  %voidSecond5 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 1, !dbg !90
  %3 = load i8*, i8** %voidSecond5, align 8, !dbg !90
  %4 = bitcast i8* %3 to i32*, !dbg !91
  call void @printWLine(i32* %4), !dbg !92
  ret void, !dbg !93
}

; Function Attrs: noinline nounwind uwtable
define internal void @good2() #0 !dbg !94 {
entry:
  %structCharVoid = alloca %struct._charVoid, align 8
  call void @llvm.dbg.declare(metadata %struct._charVoid* %structCharVoid, metadata !95, metadata !DIExpression()), !dbg !97
  %voidSecond = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 1, !dbg !98
  store i8* bitcast ([32 x i32]* @.str to i8*), i8** %voidSecond, align 8, !dbg !99
  %voidSecond1 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 1, !dbg !100
  %0 = load i8*, i8** %voidSecond1, align 8, !dbg !100
  %1 = bitcast i8* %0 to i32*, !dbg !101
  call void @printWLine(i32* %1), !dbg !102
  %charFirst = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 0, !dbg !103
  %arraydecay = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst, i64 0, i64 0, !dbg !104
  %2 = bitcast i32* %arraydecay to i8*, !dbg !104
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %2, i8* align 4 bitcast ([32 x i32]* @.str to i8*), i64 64, i1 false), !dbg !104
  %charFirst2 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 0, !dbg !105
  %arrayidx = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst2, i64 0, i64 15, !dbg !106
  store i32 0, i32* %arrayidx, align 4, !dbg !107
  %charFirst3 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 0, !dbg !108
  %arraydecay4 = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst3, i64 0, i64 0, !dbg !109
  call void @printWLine(i32* %arraydecay4), !dbg !110
  %voidSecond5 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 1, !dbg !111
  %3 = load i8*, i8** %voidSecond5, align 8, !dbg !111
  %4 = bitcast i8* %3 to i32*, !dbg !112
  call void @printWLine(i32* %4), !dbg !113
  ret void, !dbg !114
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__wchar_t_type_overrun_memcpy_15.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !5, !9}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !7, line: 74, baseType: !8)
!7 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!8 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!9 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!10 = !{i32 7, !"Dwarf Version", i32 4}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{i32 7, !"uwtable", i32 1}
!14 = !{i32 7, !"frame-pointer", i32 2}
!15 = !{!"clang version 13.0.0"}
!16 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__wchar_t_type_overrun_memcpy_15_bad", scope: !17, file: !17, line: 34, type: !18, scopeLine: 35, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__wchar_t_type_overrun_memcpy_15.c", directory: "/home/joelyang/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "structCharVoid", scope: !21, file: !17, line: 40, type: !22)
!21 = distinct !DILexicalBlock(scope: !16, file: !17, line: 39, column: 5)
!22 = !DIDerivedType(tag: DW_TAG_typedef, name: "charVoid", file: !17, line: 30, baseType: !23)
!23 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_charVoid", file: !17, line: 25, size: 640, elements: !24)
!24 = !{!25, !29, !30}
!25 = !DIDerivedType(tag: DW_TAG_member, name: "charFirst", scope: !23, file: !17, line: 27, baseType: !26, size: 512)
!26 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 512, elements: !27)
!27 = !{!28}
!28 = !DISubrange(count: 16)
!29 = !DIDerivedType(tag: DW_TAG_member, name: "voidSecond", scope: !23, file: !17, line: 28, baseType: !4, size: 64, offset: 512)
!30 = !DIDerivedType(tag: DW_TAG_member, name: "voidThird", scope: !23, file: !17, line: 29, baseType: !4, size: 64, offset: 576)
!31 = !DILocation(line: 40, column: 18, scope: !21)
!32 = !DILocation(line: 41, column: 24, scope: !21)
!33 = !DILocation(line: 41, column: 35, scope: !21)
!34 = !DILocation(line: 43, column: 46, scope: !21)
!35 = !DILocation(line: 43, column: 20, scope: !21)
!36 = !DILocation(line: 43, column: 9, scope: !21)
!37 = !DILocation(line: 45, column: 31, scope: !21)
!38 = !DILocation(line: 45, column: 9, scope: !21)
!39 = !DILocation(line: 46, column: 24, scope: !21)
!40 = !DILocation(line: 46, column: 9, scope: !21)
!41 = !DILocation(line: 46, column: 88, scope: !21)
!42 = !DILocation(line: 47, column: 46, scope: !21)
!43 = !DILocation(line: 47, column: 31, scope: !21)
!44 = !DILocation(line: 47, column: 9, scope: !21)
!45 = !DILocation(line: 48, column: 46, scope: !21)
!46 = !DILocation(line: 48, column: 20, scope: !21)
!47 = !DILocation(line: 48, column: 9, scope: !21)
!48 = !DILocation(line: 56, column: 1, scope: !16)
!49 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__wchar_t_type_overrun_memcpy_15_good", scope: !17, file: !17, line: 112, type: !18, scopeLine: 113, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!50 = !DILocation(line: 114, column: 5, scope: !49)
!51 = !DILocation(line: 115, column: 5, scope: !49)
!52 = !DILocation(line: 116, column: 1, scope: !49)
!53 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 127, type: !54, scopeLine: 128, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!54 = !DISubroutineType(types: !55)
!55 = !{!8, !8, !56}
!56 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !57, size: 64)
!57 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !58, size: 64)
!58 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!59 = !DILocalVariable(name: "argc", arg: 1, scope: !53, file: !17, line: 127, type: !8)
!60 = !DILocation(line: 127, column: 14, scope: !53)
!61 = !DILocalVariable(name: "argv", arg: 2, scope: !53, file: !17, line: 127, type: !56)
!62 = !DILocation(line: 127, column: 27, scope: !53)
!63 = !DILocation(line: 130, column: 22, scope: !53)
!64 = !DILocation(line: 130, column: 12, scope: !53)
!65 = !DILocation(line: 130, column: 5, scope: !53)
!66 = !DILocation(line: 132, column: 5, scope: !53)
!67 = !DILocation(line: 133, column: 5, scope: !53)
!68 = !DILocation(line: 134, column: 5, scope: !53)
!69 = !DILocation(line: 137, column: 5, scope: !53)
!70 = !DILocation(line: 138, column: 5, scope: !53)
!71 = !DILocation(line: 139, column: 5, scope: !53)
!72 = !DILocation(line: 141, column: 5, scope: !53)
!73 = distinct !DISubprogram(name: "good1", scope: !17, file: !17, line: 63, type: !18, scopeLine: 64, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!74 = !DILocalVariable(name: "structCharVoid", scope: !75, file: !17, line: 73, type: !22)
!75 = distinct !DILexicalBlock(scope: !73, file: !17, line: 72, column: 5)
!76 = !DILocation(line: 73, column: 18, scope: !75)
!77 = !DILocation(line: 74, column: 24, scope: !75)
!78 = !DILocation(line: 74, column: 35, scope: !75)
!79 = !DILocation(line: 76, column: 46, scope: !75)
!80 = !DILocation(line: 76, column: 20, scope: !75)
!81 = !DILocation(line: 76, column: 9, scope: !75)
!82 = !DILocation(line: 78, column: 31, scope: !75)
!83 = !DILocation(line: 78, column: 9, scope: !75)
!84 = !DILocation(line: 79, column: 24, scope: !75)
!85 = !DILocation(line: 79, column: 9, scope: !75)
!86 = !DILocation(line: 79, column: 88, scope: !75)
!87 = !DILocation(line: 80, column: 46, scope: !75)
!88 = !DILocation(line: 80, column: 31, scope: !75)
!89 = !DILocation(line: 80, column: 9, scope: !75)
!90 = !DILocation(line: 81, column: 46, scope: !75)
!91 = !DILocation(line: 81, column: 20, scope: !75)
!92 = !DILocation(line: 81, column: 9, scope: !75)
!93 = !DILocation(line: 85, column: 1, scope: !73)
!94 = distinct !DISubprogram(name: "good2", scope: !17, file: !17, line: 88, type: !18, scopeLine: 89, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!95 = !DILocalVariable(name: "structCharVoid", scope: !96, file: !17, line: 94, type: !22)
!96 = distinct !DILexicalBlock(scope: !94, file: !17, line: 93, column: 5)
!97 = !DILocation(line: 94, column: 18, scope: !96)
!98 = !DILocation(line: 95, column: 24, scope: !96)
!99 = !DILocation(line: 95, column: 35, scope: !96)
!100 = !DILocation(line: 97, column: 46, scope: !96)
!101 = !DILocation(line: 97, column: 20, scope: !96)
!102 = !DILocation(line: 97, column: 9, scope: !96)
!103 = !DILocation(line: 99, column: 31, scope: !96)
!104 = !DILocation(line: 99, column: 9, scope: !96)
!105 = !DILocation(line: 100, column: 24, scope: !96)
!106 = !DILocation(line: 100, column: 9, scope: !96)
!107 = !DILocation(line: 100, column: 88, scope: !96)
!108 = !DILocation(line: 101, column: 46, scope: !96)
!109 = !DILocation(line: 101, column: 31, scope: !96)
!110 = !DILocation(line: 101, column: 9, scope: !96)
!111 = !DILocation(line: 102, column: 46, scope: !96)
!112 = !DILocation(line: 102, column: 20, scope: !96)
!113 = !DILocation(line: 102, column: 9, scope: !96)
!114 = !DILocation(line: 110, column: 1, scope: !94)
