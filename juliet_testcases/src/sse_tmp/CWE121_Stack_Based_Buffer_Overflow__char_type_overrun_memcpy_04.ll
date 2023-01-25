; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__char_type_overrun_memcpy_04.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__char_type_overrun_memcpy_04.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._charVoid = type { [16 x i8], i8*, i8* }

@.str = private unnamed_addr constant [32 x i8] c"0123456789abcdef0123456789abcde\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__char_type_overrun_memcpy_04_bad() #0 !dbg !14 {
entry:
  %structCharVoid = alloca %struct._charVoid, align 8
  call void @llvm.dbg.declare(metadata %struct._charVoid* %structCharVoid, metadata !18, metadata !DIExpression()), !dbg !31
  %voidSecond = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 1, !dbg !32
  store i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i8** %voidSecond, align 8, !dbg !33
  %voidSecond1 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 1, !dbg !34
  %0 = load i8*, i8** %voidSecond1, align 8, !dbg !34
  call void @printLine(i8* %0), !dbg !35
  %charFirst = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 0, !dbg !36
  %arraydecay = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst, i64 0, i64 0, !dbg !37
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %arraydecay, i8* align 1 getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i64 32, i1 false), !dbg !37
  %charFirst2 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 0, !dbg !38
  %arrayidx = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst2, i64 0, i64 15, !dbg !39
  store i8 0, i8* %arrayidx, align 1, !dbg !40
  %charFirst3 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 0, !dbg !41
  %arraydecay4 = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst3, i64 0, i64 0, !dbg !42
  call void @printLine(i8* %arraydecay4), !dbg !43
  %voidSecond5 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 1, !dbg !44
  %1 = load i8*, i8** %voidSecond5, align 8, !dbg !44
  call void @printLine(i8* %1), !dbg !45
  ret void, !dbg !46
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local void @printLine(i8*) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__char_type_overrun_memcpy_04_good() #0 !dbg !47 {
entry:
  call void @good1(), !dbg !48
  call void @good2(), !dbg !49
  ret void, !dbg !50
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !51 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !56, metadata !DIExpression()), !dbg !57
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !58, metadata !DIExpression()), !dbg !59
  %call = call i64 @time(i64* null) #5, !dbg !60
  %conv = trunc i64 %call to i32, !dbg !61
  call void @srand(i32 %conv) #5, !dbg !62
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !63
  call void @CWE121_Stack_Based_Buffer_Overflow__char_type_overrun_memcpy_04_good(), !dbg !64
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !65
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !66
  call void @CWE121_Stack_Based_Buffer_Overflow__char_type_overrun_memcpy_04_bad(), !dbg !67
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !68
  ret i32 0, !dbg !69
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @good1() #0 !dbg !70 {
entry:
  %structCharVoid = alloca %struct._charVoid, align 8
  call void @llvm.dbg.declare(metadata %struct._charVoid* %structCharVoid, metadata !71, metadata !DIExpression()), !dbg !75
  %voidSecond = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 1, !dbg !76
  store i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i8** %voidSecond, align 8, !dbg !77
  %voidSecond1 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 1, !dbg !78
  %0 = load i8*, i8** %voidSecond1, align 8, !dbg !78
  call void @printLine(i8* %0), !dbg !79
  %charFirst = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 0, !dbg !80
  %arraydecay = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst, i64 0, i64 0, !dbg !81
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %arraydecay, i8* align 1 getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i64 16, i1 false), !dbg !81
  %charFirst2 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 0, !dbg !82
  %arrayidx = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst2, i64 0, i64 15, !dbg !83
  store i8 0, i8* %arrayidx, align 1, !dbg !84
  %charFirst3 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 0, !dbg !85
  %arraydecay4 = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst3, i64 0, i64 0, !dbg !86
  call void @printLine(i8* %arraydecay4), !dbg !87
  %voidSecond5 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 1, !dbg !88
  %1 = load i8*, i8** %voidSecond5, align 8, !dbg !88
  call void @printLine(i8* %1), !dbg !89
  ret void, !dbg !90
}

; Function Attrs: noinline nounwind uwtable
define internal void @good2() #0 !dbg !91 {
entry:
  %structCharVoid = alloca %struct._charVoid, align 8
  call void @llvm.dbg.declare(metadata %struct._charVoid* %structCharVoid, metadata !92, metadata !DIExpression()), !dbg !96
  %voidSecond = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 1, !dbg !97
  store i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i8** %voidSecond, align 8, !dbg !98
  %voidSecond1 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 1, !dbg !99
  %0 = load i8*, i8** %voidSecond1, align 8, !dbg !99
  call void @printLine(i8* %0), !dbg !100
  %charFirst = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 0, !dbg !101
  %arraydecay = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst, i64 0, i64 0, !dbg !102
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %arraydecay, i8* align 1 getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i64 16, i1 false), !dbg !102
  %charFirst2 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 0, !dbg !103
  %arrayidx = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst2, i64 0, i64 15, !dbg !104
  store i8 0, i8* %arrayidx, align 1, !dbg !105
  %charFirst3 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 0, !dbg !106
  %arraydecay4 = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst3, i64 0, i64 0, !dbg !107
  call void @printLine(i8* %arraydecay4), !dbg !108
  %voidSecond5 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 1, !dbg !109
  %1 = load i8*, i8** %voidSecond5, align 8, !dbg !109
  call void @printLine(i8* %1), !dbg !110
  ret void, !dbg !111
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__char_type_overrun_memcpy_04.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !5, !7}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{i32 7, !"Dwarf Version", i32 4}
!9 = !{i32 2, !"Debug Info Version", i32 3}
!10 = !{i32 1, !"wchar_size", i32 4}
!11 = !{i32 7, !"uwtable", i32 1}
!12 = !{i32 7, !"frame-pointer", i32 2}
!13 = !{!"clang version 13.0.0"}
!14 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__char_type_overrun_memcpy_04_bad", scope: !15, file: !15, line: 40, type: !16, scopeLine: 41, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__char_type_overrun_memcpy_04.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "structCharVoid", scope: !19, file: !15, line: 45, type: !22)
!19 = distinct !DILexicalBlock(scope: !20, file: !15, line: 44, column: 9)
!20 = distinct !DILexicalBlock(scope: !21, file: !15, line: 43, column: 5)
!21 = distinct !DILexicalBlock(scope: !14, file: !15, line: 42, column: 8)
!22 = !DIDerivedType(tag: DW_TAG_typedef, name: "charVoid", file: !15, line: 30, baseType: !23)
!23 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_charVoid", file: !15, line: 25, size: 256, elements: !24)
!24 = !{!25, !29, !30}
!25 = !DIDerivedType(tag: DW_TAG_member, name: "charFirst", scope: !23, file: !15, line: 27, baseType: !26, size: 128)
!26 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 128, elements: !27)
!27 = !{!28}
!28 = !DISubrange(count: 16)
!29 = !DIDerivedType(tag: DW_TAG_member, name: "voidSecond", scope: !23, file: !15, line: 28, baseType: !4, size: 64, offset: 128)
!30 = !DIDerivedType(tag: DW_TAG_member, name: "voidThird", scope: !23, file: !15, line: 29, baseType: !4, size: 64, offset: 192)
!31 = !DILocation(line: 45, column: 22, scope: !19)
!32 = !DILocation(line: 46, column: 28, scope: !19)
!33 = !DILocation(line: 46, column: 39, scope: !19)
!34 = !DILocation(line: 48, column: 46, scope: !19)
!35 = !DILocation(line: 48, column: 13, scope: !19)
!36 = !DILocation(line: 50, column: 35, scope: !19)
!37 = !DILocation(line: 50, column: 13, scope: !19)
!38 = !DILocation(line: 51, column: 28, scope: !19)
!39 = !DILocation(line: 51, column: 13, scope: !19)
!40 = !DILocation(line: 51, column: 89, scope: !19)
!41 = !DILocation(line: 52, column: 46, scope: !19)
!42 = !DILocation(line: 52, column: 31, scope: !19)
!43 = !DILocation(line: 52, column: 13, scope: !19)
!44 = !DILocation(line: 53, column: 46, scope: !19)
!45 = !DILocation(line: 53, column: 13, scope: !19)
!46 = !DILocation(line: 56, column: 1, scope: !14)
!47 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__char_type_overrun_memcpy_04_good", scope: !15, file: !15, line: 105, type: !16, scopeLine: 106, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!48 = !DILocation(line: 107, column: 5, scope: !47)
!49 = !DILocation(line: 108, column: 5, scope: !47)
!50 = !DILocation(line: 109, column: 1, scope: !47)
!51 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 120, type: !52, scopeLine: 121, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!52 = !DISubroutineType(types: !53)
!53 = !{!54, !54, !55}
!54 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!55 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!56 = !DILocalVariable(name: "argc", arg: 1, scope: !51, file: !15, line: 120, type: !54)
!57 = !DILocation(line: 120, column: 14, scope: !51)
!58 = !DILocalVariable(name: "argv", arg: 2, scope: !51, file: !15, line: 120, type: !55)
!59 = !DILocation(line: 120, column: 27, scope: !51)
!60 = !DILocation(line: 123, column: 22, scope: !51)
!61 = !DILocation(line: 123, column: 12, scope: !51)
!62 = !DILocation(line: 123, column: 5, scope: !51)
!63 = !DILocation(line: 125, column: 5, scope: !51)
!64 = !DILocation(line: 126, column: 5, scope: !51)
!65 = !DILocation(line: 127, column: 5, scope: !51)
!66 = !DILocation(line: 130, column: 5, scope: !51)
!67 = !DILocation(line: 131, column: 5, scope: !51)
!68 = !DILocation(line: 132, column: 5, scope: !51)
!69 = !DILocation(line: 134, column: 5, scope: !51)
!70 = distinct !DISubprogram(name: "good1", scope: !15, file: !15, line: 63, type: !16, scopeLine: 64, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!71 = !DILocalVariable(name: "structCharVoid", scope: !72, file: !15, line: 73, type: !22)
!72 = distinct !DILexicalBlock(scope: !73, file: !15, line: 72, column: 9)
!73 = distinct !DILexicalBlock(scope: !74, file: !15, line: 71, column: 5)
!74 = distinct !DILexicalBlock(scope: !70, file: !15, line: 65, column: 8)
!75 = !DILocation(line: 73, column: 22, scope: !72)
!76 = !DILocation(line: 74, column: 28, scope: !72)
!77 = !DILocation(line: 74, column: 39, scope: !72)
!78 = !DILocation(line: 76, column: 46, scope: !72)
!79 = !DILocation(line: 76, column: 13, scope: !72)
!80 = !DILocation(line: 78, column: 35, scope: !72)
!81 = !DILocation(line: 78, column: 13, scope: !72)
!82 = !DILocation(line: 79, column: 28, scope: !72)
!83 = !DILocation(line: 79, column: 13, scope: !72)
!84 = !DILocation(line: 79, column: 89, scope: !72)
!85 = !DILocation(line: 80, column: 46, scope: !72)
!86 = !DILocation(line: 80, column: 31, scope: !72)
!87 = !DILocation(line: 80, column: 13, scope: !72)
!88 = !DILocation(line: 81, column: 46, scope: !72)
!89 = !DILocation(line: 81, column: 13, scope: !72)
!90 = !DILocation(line: 84, column: 1, scope: !70)
!91 = distinct !DISubprogram(name: "good2", scope: !15, file: !15, line: 87, type: !16, scopeLine: 88, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!92 = !DILocalVariable(name: "structCharVoid", scope: !93, file: !15, line: 92, type: !22)
!93 = distinct !DILexicalBlock(scope: !94, file: !15, line: 91, column: 9)
!94 = distinct !DILexicalBlock(scope: !95, file: !15, line: 90, column: 5)
!95 = distinct !DILexicalBlock(scope: !91, file: !15, line: 89, column: 8)
!96 = !DILocation(line: 92, column: 22, scope: !93)
!97 = !DILocation(line: 93, column: 28, scope: !93)
!98 = !DILocation(line: 93, column: 39, scope: !93)
!99 = !DILocation(line: 95, column: 46, scope: !93)
!100 = !DILocation(line: 95, column: 13, scope: !93)
!101 = !DILocation(line: 97, column: 35, scope: !93)
!102 = !DILocation(line: 97, column: 13, scope: !93)
!103 = !DILocation(line: 98, column: 28, scope: !93)
!104 = !DILocation(line: 98, column: 13, scope: !93)
!105 = !DILocation(line: 98, column: 89, scope: !93)
!106 = !DILocation(line: 99, column: 46, scope: !93)
!107 = !DILocation(line: 99, column: 31, scope: !93)
!108 = !DILocation(line: 99, column: 13, scope: !93)
!109 = !DILocation(line: 100, column: 46, scope: !93)
!110 = !DILocation(line: 100, column: 13, scope: !93)
!111 = !DILocation(line: 103, column: 1, scope: !91)
