; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__char_type_overrun_memmove_15.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__char_type_overrun_memmove_15.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._charVoid = type { [16 x i8], i8*, i8* }

@.str = private unnamed_addr constant [32 x i8] c"0123456789abcdef0123456789abcde\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__char_type_overrun_memmove_15_bad() #0 !dbg !14 {
entry:
  %structCharVoid = alloca %struct._charVoid, align 8
  call void @llvm.dbg.declare(metadata %struct._charVoid* %structCharVoid, metadata !18, metadata !DIExpression()), !dbg !29
  %voidSecond = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 1, !dbg !30
  store i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i8** %voidSecond, align 8, !dbg !31
  %voidSecond1 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 1, !dbg !32
  %0 = load i8*, i8** %voidSecond1, align 8, !dbg !32
  call void @printLine(i8* %0), !dbg !33
  %charFirst = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 0, !dbg !34
  %arraydecay = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst, i64 0, i64 0, !dbg !35
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 8 %arraydecay, i8* align 1 getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i64 32, i1 false), !dbg !35
  %charFirst2 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 0, !dbg !36
  %arrayidx = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst2, i64 0, i64 15, !dbg !37
  store i8 0, i8* %arrayidx, align 1, !dbg !38
  %charFirst3 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 0, !dbg !39
  %arraydecay4 = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst3, i64 0, i64 0, !dbg !40
  call void @printLine(i8* %arraydecay4), !dbg !41
  %voidSecond5 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 1, !dbg !42
  %1 = load i8*, i8** %voidSecond5, align 8, !dbg !42
  call void @printLine(i8* %1), !dbg !43
  ret void, !dbg !44
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local void @printLine(i8*) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__char_type_overrun_memmove_15_good() #0 !dbg !45 {
entry:
  call void @good1(), !dbg !46
  call void @good2(), !dbg !47
  ret void, !dbg !48
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !49 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !54, metadata !DIExpression()), !dbg !55
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !56, metadata !DIExpression()), !dbg !57
  %call = call i64 @time(i64* null) #5, !dbg !58
  %conv = trunc i64 %call to i32, !dbg !59
  call void @srand(i32 %conv) #5, !dbg !60
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !61
  call void @CWE121_Stack_Based_Buffer_Overflow__char_type_overrun_memmove_15_good(), !dbg !62
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !63
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !64
  call void @CWE121_Stack_Based_Buffer_Overflow__char_type_overrun_memmove_15_bad(), !dbg !65
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !66
  ret i32 0, !dbg !67
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @good1() #0 !dbg !68 {
entry:
  %structCharVoid = alloca %struct._charVoid, align 8
  call void @llvm.dbg.declare(metadata %struct._charVoid* %structCharVoid, metadata !69, metadata !DIExpression()), !dbg !71
  %voidSecond = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 1, !dbg !72
  store i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i8** %voidSecond, align 8, !dbg !73
  %voidSecond1 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 1, !dbg !74
  %0 = load i8*, i8** %voidSecond1, align 8, !dbg !74
  call void @printLine(i8* %0), !dbg !75
  %charFirst = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 0, !dbg !76
  %arraydecay = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst, i64 0, i64 0, !dbg !77
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 8 %arraydecay, i8* align 1 getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i64 16, i1 false), !dbg !77
  %charFirst2 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 0, !dbg !78
  %arrayidx = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst2, i64 0, i64 15, !dbg !79
  store i8 0, i8* %arrayidx, align 1, !dbg !80
  %charFirst3 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 0, !dbg !81
  %arraydecay4 = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst3, i64 0, i64 0, !dbg !82
  call void @printLine(i8* %arraydecay4), !dbg !83
  %voidSecond5 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 1, !dbg !84
  %1 = load i8*, i8** %voidSecond5, align 8, !dbg !84
  call void @printLine(i8* %1), !dbg !85
  ret void, !dbg !86
}

; Function Attrs: noinline nounwind uwtable
define internal void @good2() #0 !dbg !87 {
entry:
  %structCharVoid = alloca %struct._charVoid, align 8
  call void @llvm.dbg.declare(metadata %struct._charVoid* %structCharVoid, metadata !88, metadata !DIExpression()), !dbg !90
  %voidSecond = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 1, !dbg !91
  store i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i8** %voidSecond, align 8, !dbg !92
  %voidSecond1 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 1, !dbg !93
  %0 = load i8*, i8** %voidSecond1, align 8, !dbg !93
  call void @printLine(i8* %0), !dbg !94
  %charFirst = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 0, !dbg !95
  %arraydecay = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst, i64 0, i64 0, !dbg !96
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 8 %arraydecay, i8* align 1 getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i64 16, i1 false), !dbg !96
  %charFirst2 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 0, !dbg !97
  %arrayidx = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst2, i64 0, i64 15, !dbg !98
  store i8 0, i8* %arrayidx, align 1, !dbg !99
  %charFirst3 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 0, !dbg !100
  %arraydecay4 = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst3, i64 0, i64 0, !dbg !101
  call void @printLine(i8* %arraydecay4), !dbg !102
  %voidSecond5 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 1, !dbg !103
  %1 = load i8*, i8** %voidSecond5, align 8, !dbg !103
  call void @printLine(i8* %1), !dbg !104
  ret void, !dbg !105
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__char_type_overrun_memmove_15.c", directory: "/home/joelyang/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__char_type_overrun_memmove_15_bad", scope: !15, file: !15, line: 34, type: !16, scopeLine: 35, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__char_type_overrun_memmove_15.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "structCharVoid", scope: !19, file: !15, line: 40, type: !20)
!19 = distinct !DILexicalBlock(scope: !14, file: !15, line: 39, column: 5)
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "charVoid", file: !15, line: 30, baseType: !21)
!21 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_charVoid", file: !15, line: 25, size: 256, elements: !22)
!22 = !{!23, !27, !28}
!23 = !DIDerivedType(tag: DW_TAG_member, name: "charFirst", scope: !21, file: !15, line: 27, baseType: !24, size: 128)
!24 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 128, elements: !25)
!25 = !{!26}
!26 = !DISubrange(count: 16)
!27 = !DIDerivedType(tag: DW_TAG_member, name: "voidSecond", scope: !21, file: !15, line: 28, baseType: !4, size: 64, offset: 128)
!28 = !DIDerivedType(tag: DW_TAG_member, name: "voidThird", scope: !21, file: !15, line: 29, baseType: !4, size: 64, offset: 192)
!29 = !DILocation(line: 40, column: 18, scope: !19)
!30 = !DILocation(line: 41, column: 24, scope: !19)
!31 = !DILocation(line: 41, column: 35, scope: !19)
!32 = !DILocation(line: 43, column: 42, scope: !19)
!33 = !DILocation(line: 43, column: 9, scope: !19)
!34 = !DILocation(line: 45, column: 32, scope: !19)
!35 = !DILocation(line: 45, column: 9, scope: !19)
!36 = !DILocation(line: 46, column: 24, scope: !19)
!37 = !DILocation(line: 46, column: 9, scope: !19)
!38 = !DILocation(line: 46, column: 85, scope: !19)
!39 = !DILocation(line: 47, column: 42, scope: !19)
!40 = !DILocation(line: 47, column: 27, scope: !19)
!41 = !DILocation(line: 47, column: 9, scope: !19)
!42 = !DILocation(line: 48, column: 42, scope: !19)
!43 = !DILocation(line: 48, column: 9, scope: !19)
!44 = !DILocation(line: 56, column: 1, scope: !14)
!45 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__char_type_overrun_memmove_15_good", scope: !15, file: !15, line: 112, type: !16, scopeLine: 113, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!46 = !DILocation(line: 114, column: 5, scope: !45)
!47 = !DILocation(line: 115, column: 5, scope: !45)
!48 = !DILocation(line: 116, column: 1, scope: !45)
!49 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 127, type: !50, scopeLine: 128, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!50 = !DISubroutineType(types: !51)
!51 = !{!52, !52, !53}
!52 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!53 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!54 = !DILocalVariable(name: "argc", arg: 1, scope: !49, file: !15, line: 127, type: !52)
!55 = !DILocation(line: 127, column: 14, scope: !49)
!56 = !DILocalVariable(name: "argv", arg: 2, scope: !49, file: !15, line: 127, type: !53)
!57 = !DILocation(line: 127, column: 27, scope: !49)
!58 = !DILocation(line: 130, column: 22, scope: !49)
!59 = !DILocation(line: 130, column: 12, scope: !49)
!60 = !DILocation(line: 130, column: 5, scope: !49)
!61 = !DILocation(line: 132, column: 5, scope: !49)
!62 = !DILocation(line: 133, column: 5, scope: !49)
!63 = !DILocation(line: 134, column: 5, scope: !49)
!64 = !DILocation(line: 137, column: 5, scope: !49)
!65 = !DILocation(line: 138, column: 5, scope: !49)
!66 = !DILocation(line: 139, column: 5, scope: !49)
!67 = !DILocation(line: 141, column: 5, scope: !49)
!68 = distinct !DISubprogram(name: "good1", scope: !15, file: !15, line: 63, type: !16, scopeLine: 64, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!69 = !DILocalVariable(name: "structCharVoid", scope: !70, file: !15, line: 73, type: !20)
!70 = distinct !DILexicalBlock(scope: !68, file: !15, line: 72, column: 5)
!71 = !DILocation(line: 73, column: 18, scope: !70)
!72 = !DILocation(line: 74, column: 24, scope: !70)
!73 = !DILocation(line: 74, column: 35, scope: !70)
!74 = !DILocation(line: 76, column: 42, scope: !70)
!75 = !DILocation(line: 76, column: 9, scope: !70)
!76 = !DILocation(line: 78, column: 32, scope: !70)
!77 = !DILocation(line: 78, column: 9, scope: !70)
!78 = !DILocation(line: 79, column: 24, scope: !70)
!79 = !DILocation(line: 79, column: 9, scope: !70)
!80 = !DILocation(line: 79, column: 85, scope: !70)
!81 = !DILocation(line: 80, column: 42, scope: !70)
!82 = !DILocation(line: 80, column: 27, scope: !70)
!83 = !DILocation(line: 80, column: 9, scope: !70)
!84 = !DILocation(line: 81, column: 42, scope: !70)
!85 = !DILocation(line: 81, column: 9, scope: !70)
!86 = !DILocation(line: 85, column: 1, scope: !68)
!87 = distinct !DISubprogram(name: "good2", scope: !15, file: !15, line: 88, type: !16, scopeLine: 89, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!88 = !DILocalVariable(name: "structCharVoid", scope: !89, file: !15, line: 94, type: !20)
!89 = distinct !DILexicalBlock(scope: !87, file: !15, line: 93, column: 5)
!90 = !DILocation(line: 94, column: 18, scope: !89)
!91 = !DILocation(line: 95, column: 24, scope: !89)
!92 = !DILocation(line: 95, column: 35, scope: !89)
!93 = !DILocation(line: 97, column: 42, scope: !89)
!94 = !DILocation(line: 97, column: 9, scope: !89)
!95 = !DILocation(line: 99, column: 32, scope: !89)
!96 = !DILocation(line: 99, column: 9, scope: !89)
!97 = !DILocation(line: 100, column: 24, scope: !89)
!98 = !DILocation(line: 100, column: 9, scope: !89)
!99 = !DILocation(line: 100, column: 85, scope: !89)
!100 = !DILocation(line: 101, column: 42, scope: !89)
!101 = !DILocation(line: 101, column: 27, scope: !89)
!102 = !DILocation(line: 101, column: 9, scope: !89)
!103 = !DILocation(line: 102, column: 42, scope: !89)
!104 = !DILocation(line: 102, column: 9, scope: !89)
!105 = !DILocation(line: 110, column: 1, scope: !87)
