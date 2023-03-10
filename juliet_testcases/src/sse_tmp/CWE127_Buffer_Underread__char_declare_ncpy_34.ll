; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__char_declare_ncpy_34.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__char_declare_ncpy_34.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%union.CWE127_Buffer_Underread__char_declare_ncpy_34_unionType = type { i8* }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__char_declare_ncpy_34_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  %myUnion = alloca %union.CWE127_Buffer_Underread__char_declare_ncpy_34_unionType, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %data2 = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !15, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata %union.CWE127_Buffer_Underread__char_declare_ncpy_34_unionType* %myUnion, metadata !19, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !26, metadata !DIExpression()), !dbg !30
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !31
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 99, i1 false), !dbg !31
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 99, !dbg !32
  store i8 0, i8* %arrayidx, align 1, !dbg !33
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !34
  %add.ptr = getelementptr inbounds i8, i8* %arraydecay1, i64 -8, !dbg !35
  store i8* %add.ptr, i8** %data, align 8, !dbg !36
  %0 = load i8*, i8** %data, align 8, !dbg !37
  %unionFirst = bitcast %union.CWE127_Buffer_Underread__char_declare_ncpy_34_unionType* %myUnion to i8**, !dbg !38
  store i8* %0, i8** %unionFirst, align 8, !dbg !39
  call void @llvm.dbg.declare(metadata i8** %data2, metadata !40, metadata !DIExpression()), !dbg !42
  %unionSecond = bitcast %union.CWE127_Buffer_Underread__char_declare_ncpy_34_unionType* %myUnion to i8**, !dbg !43
  %1 = load i8*, i8** %unionSecond, align 8, !dbg !43
  store i8* %1, i8** %data2, align 8, !dbg !42
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !44, metadata !DIExpression()), !dbg !46
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !47
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay3, i8 67, i64 99, i1 false), !dbg !47
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !48
  store i8 0, i8* %arrayidx4, align 1, !dbg !49
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !50
  %2 = load i8*, i8** %data2, align 8, !dbg !51
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !52
  %call = call i64 @strlen(i8* %arraydecay6) #6, !dbg !53
  %call7 = call i8* @strncpy(i8* %arraydecay5, i8* %2, i64 %call) #7, !dbg !54
  %arrayidx8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !55
  store i8 0, i8* %arrayidx8, align 1, !dbg !56
  %arraydecay9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !57
  call void @printLine(i8* %arraydecay9), !dbg !58
  ret void, !dbg !59
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i8* @strncpy(i8*, i8*, i64) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #4

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__char_declare_ncpy_34_good() #0 !dbg !60 {
entry:
  call void @goodG2B(), !dbg !61
  ret void, !dbg !62
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !63 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !68, metadata !DIExpression()), !dbg !69
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !70, metadata !DIExpression()), !dbg !71
  %call = call i64 @time(i64* null) #7, !dbg !72
  %conv = trunc i64 %call to i32, !dbg !73
  call void @srand(i32 %conv) #7, !dbg !74
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !75
  call void @CWE127_Buffer_Underread__char_declare_ncpy_34_good(), !dbg !76
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !77
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !78
  call void @CWE127_Buffer_Underread__char_declare_ncpy_34_bad(), !dbg !79
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !80
  ret i32 0, !dbg !81
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !82 {
entry:
  %data = alloca i8*, align 8
  %myUnion = alloca %union.CWE127_Buffer_Underread__char_declare_ncpy_34_unionType, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %data2 = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !83, metadata !DIExpression()), !dbg !84
  call void @llvm.dbg.declare(metadata %union.CWE127_Buffer_Underread__char_declare_ncpy_34_unionType* %myUnion, metadata !85, metadata !DIExpression()), !dbg !86
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !87, metadata !DIExpression()), !dbg !88
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !89
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 99, i1 false), !dbg !89
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 99, !dbg !90
  store i8 0, i8* %arrayidx, align 1, !dbg !91
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !92
  store i8* %arraydecay1, i8** %data, align 8, !dbg !93
  %0 = load i8*, i8** %data, align 8, !dbg !94
  %unionFirst = bitcast %union.CWE127_Buffer_Underread__char_declare_ncpy_34_unionType* %myUnion to i8**, !dbg !95
  store i8* %0, i8** %unionFirst, align 8, !dbg !96
  call void @llvm.dbg.declare(metadata i8** %data2, metadata !97, metadata !DIExpression()), !dbg !99
  %unionSecond = bitcast %union.CWE127_Buffer_Underread__char_declare_ncpy_34_unionType* %myUnion to i8**, !dbg !100
  %1 = load i8*, i8** %unionSecond, align 8, !dbg !100
  store i8* %1, i8** %data2, align 8, !dbg !99
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !101, metadata !DIExpression()), !dbg !103
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !104
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay3, i8 67, i64 99, i1 false), !dbg !104
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !105
  store i8 0, i8* %arrayidx4, align 1, !dbg !106
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !107
  %2 = load i8*, i8** %data2, align 8, !dbg !108
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !109
  %call = call i64 @strlen(i8* %arraydecay6) #6, !dbg !110
  %call7 = call i8* @strncpy(i8* %arraydecay5, i8* %2, i64 %call) #7, !dbg !111
  %arrayidx8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !112
  store i8 0, i8* %arrayidx8, align 1, !dbg !113
  %arraydecay9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !114
  call void @printLine(i8* %arraydecay9), !dbg !115
  ret void, !dbg !116
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__char_declare_ncpy_34.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__char_declare_ncpy_34_bad", scope: !12, file: !12, line: 29, type: !13, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__char_declare_ncpy_34.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 31, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!18 = !DILocation(line: 31, column: 12, scope: !11)
!19 = !DILocalVariable(name: "myUnion", scope: !11, file: !12, line: 32, type: !20)
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE127_Buffer_Underread__char_declare_ncpy_34_unionType", file: !12, line: 25, baseType: !21)
!21 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !12, line: 21, size: 64, elements: !22)
!22 = !{!23, !24}
!23 = !DIDerivedType(tag: DW_TAG_member, name: "unionFirst", scope: !21, file: !12, line: 23, baseType: !16, size: 64)
!24 = !DIDerivedType(tag: DW_TAG_member, name: "unionSecond", scope: !21, file: !12, line: 24, baseType: !16, size: 64)
!25 = !DILocation(line: 32, column: 61, scope: !11)
!26 = !DILocalVariable(name: "dataBuffer", scope: !11, file: !12, line: 33, type: !27)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 800, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 100)
!30 = !DILocation(line: 33, column: 10, scope: !11)
!31 = !DILocation(line: 34, column: 5, scope: !11)
!32 = !DILocation(line: 35, column: 5, scope: !11)
!33 = !DILocation(line: 35, column: 23, scope: !11)
!34 = !DILocation(line: 37, column: 12, scope: !11)
!35 = !DILocation(line: 37, column: 23, scope: !11)
!36 = !DILocation(line: 37, column: 10, scope: !11)
!37 = !DILocation(line: 38, column: 26, scope: !11)
!38 = !DILocation(line: 38, column: 13, scope: !11)
!39 = !DILocation(line: 38, column: 24, scope: !11)
!40 = !DILocalVariable(name: "data", scope: !41, file: !12, line: 40, type: !16)
!41 = distinct !DILexicalBlock(scope: !11, file: !12, line: 39, column: 5)
!42 = !DILocation(line: 40, column: 16, scope: !41)
!43 = !DILocation(line: 40, column: 31, scope: !41)
!44 = !DILocalVariable(name: "dest", scope: !45, file: !12, line: 42, type: !27)
!45 = distinct !DILexicalBlock(scope: !41, file: !12, line: 41, column: 9)
!46 = !DILocation(line: 42, column: 18, scope: !45)
!47 = !DILocation(line: 43, column: 13, scope: !45)
!48 = !DILocation(line: 44, column: 13, scope: !45)
!49 = !DILocation(line: 44, column: 25, scope: !45)
!50 = !DILocation(line: 46, column: 21, scope: !45)
!51 = !DILocation(line: 46, column: 27, scope: !45)
!52 = !DILocation(line: 46, column: 40, scope: !45)
!53 = !DILocation(line: 46, column: 33, scope: !45)
!54 = !DILocation(line: 46, column: 13, scope: !45)
!55 = !DILocation(line: 48, column: 13, scope: !45)
!56 = !DILocation(line: 48, column: 25, scope: !45)
!57 = !DILocation(line: 49, column: 23, scope: !45)
!58 = !DILocation(line: 49, column: 13, scope: !45)
!59 = !DILocation(line: 52, column: 1, scope: !11)
!60 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__char_declare_ncpy_34_good", scope: !12, file: !12, line: 84, type: !13, scopeLine: 85, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!61 = !DILocation(line: 86, column: 5, scope: !60)
!62 = !DILocation(line: 87, column: 1, scope: !60)
!63 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 98, type: !64, scopeLine: 99, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!64 = !DISubroutineType(types: !65)
!65 = !{!66, !66, !67}
!66 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!67 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!68 = !DILocalVariable(name: "argc", arg: 1, scope: !63, file: !12, line: 98, type: !66)
!69 = !DILocation(line: 98, column: 14, scope: !63)
!70 = !DILocalVariable(name: "argv", arg: 2, scope: !63, file: !12, line: 98, type: !67)
!71 = !DILocation(line: 98, column: 27, scope: !63)
!72 = !DILocation(line: 101, column: 22, scope: !63)
!73 = !DILocation(line: 101, column: 12, scope: !63)
!74 = !DILocation(line: 101, column: 5, scope: !63)
!75 = !DILocation(line: 103, column: 5, scope: !63)
!76 = !DILocation(line: 104, column: 5, scope: !63)
!77 = !DILocation(line: 105, column: 5, scope: !63)
!78 = !DILocation(line: 108, column: 5, scope: !63)
!79 = !DILocation(line: 109, column: 5, scope: !63)
!80 = !DILocation(line: 110, column: 5, scope: !63)
!81 = !DILocation(line: 112, column: 5, scope: !63)
!82 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 59, type: !13, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!83 = !DILocalVariable(name: "data", scope: !82, file: !12, line: 61, type: !16)
!84 = !DILocation(line: 61, column: 12, scope: !82)
!85 = !DILocalVariable(name: "myUnion", scope: !82, file: !12, line: 62, type: !20)
!86 = !DILocation(line: 62, column: 61, scope: !82)
!87 = !DILocalVariable(name: "dataBuffer", scope: !82, file: !12, line: 63, type: !27)
!88 = !DILocation(line: 63, column: 10, scope: !82)
!89 = !DILocation(line: 64, column: 5, scope: !82)
!90 = !DILocation(line: 65, column: 5, scope: !82)
!91 = !DILocation(line: 65, column: 23, scope: !82)
!92 = !DILocation(line: 67, column: 12, scope: !82)
!93 = !DILocation(line: 67, column: 10, scope: !82)
!94 = !DILocation(line: 68, column: 26, scope: !82)
!95 = !DILocation(line: 68, column: 13, scope: !82)
!96 = !DILocation(line: 68, column: 24, scope: !82)
!97 = !DILocalVariable(name: "data", scope: !98, file: !12, line: 70, type: !16)
!98 = distinct !DILexicalBlock(scope: !82, file: !12, line: 69, column: 5)
!99 = !DILocation(line: 70, column: 16, scope: !98)
!100 = !DILocation(line: 70, column: 31, scope: !98)
!101 = !DILocalVariable(name: "dest", scope: !102, file: !12, line: 72, type: !27)
!102 = distinct !DILexicalBlock(scope: !98, file: !12, line: 71, column: 9)
!103 = !DILocation(line: 72, column: 18, scope: !102)
!104 = !DILocation(line: 73, column: 13, scope: !102)
!105 = !DILocation(line: 74, column: 13, scope: !102)
!106 = !DILocation(line: 74, column: 25, scope: !102)
!107 = !DILocation(line: 76, column: 21, scope: !102)
!108 = !DILocation(line: 76, column: 27, scope: !102)
!109 = !DILocation(line: 76, column: 40, scope: !102)
!110 = !DILocation(line: 76, column: 33, scope: !102)
!111 = !DILocation(line: 76, column: 13, scope: !102)
!112 = !DILocation(line: 78, column: 13, scope: !102)
!113 = !DILocation(line: 78, column: 25, scope: !102)
!114 = !DILocation(line: 79, column: 23, scope: !102)
!115 = !DILocation(line: 79, column: 13, scope: !102)
!116 = !DILocation(line: 82, column: 1, scope: !82)
