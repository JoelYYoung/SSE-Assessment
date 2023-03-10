; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__char_declare_cpy_34.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__char_declare_cpy_34.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%union.CWE127_Buffer_Underread__char_declare_cpy_34_unionType = type { i8* }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__char_declare_cpy_34_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  %myUnion = alloca %union.CWE127_Buffer_Underread__char_declare_cpy_34_unionType, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %data2 = alloca i8*, align 8
  %dest = alloca [200 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !15, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata %union.CWE127_Buffer_Underread__char_declare_cpy_34_unionType* %myUnion, metadata !19, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !26, metadata !DIExpression()), !dbg !30
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !31
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 99, i1 false), !dbg !31
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 99, !dbg !32
  store i8 0, i8* %arrayidx, align 1, !dbg !33
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !34
  %add.ptr = getelementptr inbounds i8, i8* %arraydecay1, i64 -8, !dbg !35
  store i8* %add.ptr, i8** %data, align 8, !dbg !36
  %0 = load i8*, i8** %data, align 8, !dbg !37
  %unionFirst = bitcast %union.CWE127_Buffer_Underread__char_declare_cpy_34_unionType* %myUnion to i8**, !dbg !38
  store i8* %0, i8** %unionFirst, align 8, !dbg !39
  call void @llvm.dbg.declare(metadata i8** %data2, metadata !40, metadata !DIExpression()), !dbg !42
  %unionSecond = bitcast %union.CWE127_Buffer_Underread__char_declare_cpy_34_unionType* %myUnion to i8**, !dbg !43
  %1 = load i8*, i8** %unionSecond, align 8, !dbg !43
  store i8* %1, i8** %data2, align 8, !dbg !42
  call void @llvm.dbg.declare(metadata [200 x i8]* %dest, metadata !44, metadata !DIExpression()), !dbg !49
  %arraydecay3 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !50
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay3, i8 67, i64 199, i1 false), !dbg !50
  %arrayidx4 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 199, !dbg !51
  store i8 0, i8* %arrayidx4, align 1, !dbg !52
  %arraydecay5 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !53
  %2 = load i8*, i8** %data2, align 8, !dbg !54
  %call = call i8* @strcpy(i8* %arraydecay5, i8* %2) #5, !dbg !55
  %arraydecay6 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !56
  call void @printLine(i8* %arraydecay6), !dbg !57
  ret void, !dbg !58
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__char_declare_cpy_34_good() #0 !dbg !59 {
entry:
  call void @goodG2B(), !dbg !60
  ret void, !dbg !61
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !62 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !67, metadata !DIExpression()), !dbg !68
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !69, metadata !DIExpression()), !dbg !70
  %call = call i64 @time(i64* null) #5, !dbg !71
  %conv = trunc i64 %call to i32, !dbg !72
  call void @srand(i32 %conv) #5, !dbg !73
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !74
  call void @CWE127_Buffer_Underread__char_declare_cpy_34_good(), !dbg !75
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !76
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !77
  call void @CWE127_Buffer_Underread__char_declare_cpy_34_bad(), !dbg !78
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !79
  ret i32 0, !dbg !80
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !81 {
entry:
  %data = alloca i8*, align 8
  %myUnion = alloca %union.CWE127_Buffer_Underread__char_declare_cpy_34_unionType, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %data2 = alloca i8*, align 8
  %dest = alloca [200 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !82, metadata !DIExpression()), !dbg !83
  call void @llvm.dbg.declare(metadata %union.CWE127_Buffer_Underread__char_declare_cpy_34_unionType* %myUnion, metadata !84, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !86, metadata !DIExpression()), !dbg !87
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !88
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 99, i1 false), !dbg !88
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 99, !dbg !89
  store i8 0, i8* %arrayidx, align 1, !dbg !90
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !91
  store i8* %arraydecay1, i8** %data, align 8, !dbg !92
  %0 = load i8*, i8** %data, align 8, !dbg !93
  %unionFirst = bitcast %union.CWE127_Buffer_Underread__char_declare_cpy_34_unionType* %myUnion to i8**, !dbg !94
  store i8* %0, i8** %unionFirst, align 8, !dbg !95
  call void @llvm.dbg.declare(metadata i8** %data2, metadata !96, metadata !DIExpression()), !dbg !98
  %unionSecond = bitcast %union.CWE127_Buffer_Underread__char_declare_cpy_34_unionType* %myUnion to i8**, !dbg !99
  %1 = load i8*, i8** %unionSecond, align 8, !dbg !99
  store i8* %1, i8** %data2, align 8, !dbg !98
  call void @llvm.dbg.declare(metadata [200 x i8]* %dest, metadata !100, metadata !DIExpression()), !dbg !102
  %arraydecay3 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !103
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay3, i8 67, i64 199, i1 false), !dbg !103
  %arrayidx4 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 199, !dbg !104
  store i8 0, i8* %arrayidx4, align 1, !dbg !105
  %arraydecay5 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !106
  %2 = load i8*, i8** %data2, align 8, !dbg !107
  %call = call i8* @strcpy(i8* %arraydecay5, i8* %2) #5, !dbg !108
  %arraydecay6 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !109
  call void @printLine(i8* %arraydecay6), !dbg !110
  ret void, !dbg !111
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__char_declare_cpy_34.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__char_declare_cpy_34_bad", scope: !12, file: !12, line: 29, type: !13, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__char_declare_cpy_34.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 31, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!18 = !DILocation(line: 31, column: 12, scope: !11)
!19 = !DILocalVariable(name: "myUnion", scope: !11, file: !12, line: 32, type: !20)
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE127_Buffer_Underread__char_declare_cpy_34_unionType", file: !12, line: 25, baseType: !21)
!21 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !12, line: 21, size: 64, elements: !22)
!22 = !{!23, !24}
!23 = !DIDerivedType(tag: DW_TAG_member, name: "unionFirst", scope: !21, file: !12, line: 23, baseType: !16, size: 64)
!24 = !DIDerivedType(tag: DW_TAG_member, name: "unionSecond", scope: !21, file: !12, line: 24, baseType: !16, size: 64)
!25 = !DILocation(line: 32, column: 60, scope: !11)
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
!44 = !DILocalVariable(name: "dest", scope: !45, file: !12, line: 42, type: !46)
!45 = distinct !DILexicalBlock(scope: !41, file: !12, line: 41, column: 9)
!46 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 1600, elements: !47)
!47 = !{!48}
!48 = !DISubrange(count: 200)
!49 = !DILocation(line: 42, column: 18, scope: !45)
!50 = !DILocation(line: 43, column: 13, scope: !45)
!51 = !DILocation(line: 44, column: 13, scope: !45)
!52 = !DILocation(line: 44, column: 27, scope: !45)
!53 = !DILocation(line: 46, column: 20, scope: !45)
!54 = !DILocation(line: 46, column: 26, scope: !45)
!55 = !DILocation(line: 46, column: 13, scope: !45)
!56 = !DILocation(line: 47, column: 23, scope: !45)
!57 = !DILocation(line: 47, column: 13, scope: !45)
!58 = !DILocation(line: 50, column: 1, scope: !11)
!59 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__char_declare_cpy_34_good", scope: !12, file: !12, line: 80, type: !13, scopeLine: 81, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!60 = !DILocation(line: 82, column: 5, scope: !59)
!61 = !DILocation(line: 83, column: 1, scope: !59)
!62 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 94, type: !63, scopeLine: 95, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!63 = !DISubroutineType(types: !64)
!64 = !{!65, !65, !66}
!65 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!66 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!67 = !DILocalVariable(name: "argc", arg: 1, scope: !62, file: !12, line: 94, type: !65)
!68 = !DILocation(line: 94, column: 14, scope: !62)
!69 = !DILocalVariable(name: "argv", arg: 2, scope: !62, file: !12, line: 94, type: !66)
!70 = !DILocation(line: 94, column: 27, scope: !62)
!71 = !DILocation(line: 97, column: 22, scope: !62)
!72 = !DILocation(line: 97, column: 12, scope: !62)
!73 = !DILocation(line: 97, column: 5, scope: !62)
!74 = !DILocation(line: 99, column: 5, scope: !62)
!75 = !DILocation(line: 100, column: 5, scope: !62)
!76 = !DILocation(line: 101, column: 5, scope: !62)
!77 = !DILocation(line: 104, column: 5, scope: !62)
!78 = !DILocation(line: 105, column: 5, scope: !62)
!79 = !DILocation(line: 106, column: 5, scope: !62)
!80 = !DILocation(line: 108, column: 5, scope: !62)
!81 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 57, type: !13, scopeLine: 58, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!82 = !DILocalVariable(name: "data", scope: !81, file: !12, line: 59, type: !16)
!83 = !DILocation(line: 59, column: 12, scope: !81)
!84 = !DILocalVariable(name: "myUnion", scope: !81, file: !12, line: 60, type: !20)
!85 = !DILocation(line: 60, column: 60, scope: !81)
!86 = !DILocalVariable(name: "dataBuffer", scope: !81, file: !12, line: 61, type: !27)
!87 = !DILocation(line: 61, column: 10, scope: !81)
!88 = !DILocation(line: 62, column: 5, scope: !81)
!89 = !DILocation(line: 63, column: 5, scope: !81)
!90 = !DILocation(line: 63, column: 23, scope: !81)
!91 = !DILocation(line: 65, column: 12, scope: !81)
!92 = !DILocation(line: 65, column: 10, scope: !81)
!93 = !DILocation(line: 66, column: 26, scope: !81)
!94 = !DILocation(line: 66, column: 13, scope: !81)
!95 = !DILocation(line: 66, column: 24, scope: !81)
!96 = !DILocalVariable(name: "data", scope: !97, file: !12, line: 68, type: !16)
!97 = distinct !DILexicalBlock(scope: !81, file: !12, line: 67, column: 5)
!98 = !DILocation(line: 68, column: 16, scope: !97)
!99 = !DILocation(line: 68, column: 31, scope: !97)
!100 = !DILocalVariable(name: "dest", scope: !101, file: !12, line: 70, type: !46)
!101 = distinct !DILexicalBlock(scope: !97, file: !12, line: 69, column: 9)
!102 = !DILocation(line: 70, column: 18, scope: !101)
!103 = !DILocation(line: 71, column: 13, scope: !101)
!104 = !DILocation(line: 72, column: 13, scope: !101)
!105 = !DILocation(line: 72, column: 27, scope: !101)
!106 = !DILocation(line: 74, column: 20, scope: !101)
!107 = !DILocation(line: 74, column: 26, scope: !101)
!108 = !DILocation(line: 74, column: 13, scope: !101)
!109 = !DILocation(line: 75, column: 23, scope: !101)
!110 = !DILocation(line: 75, column: 13, scope: !101)
!111 = !DILocation(line: 78, column: 1, scope: !81)
