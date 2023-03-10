; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__char_declare_memmove_06.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__char_declare_memmove_06.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__char_declare_memmove_06_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !15, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !19, metadata !DIExpression()), !dbg !23
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !24
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 99, i1 false), !dbg !24
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 99, !dbg !25
  store i8 0, i8* %arrayidx, align 1, !dbg !26
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !27
  %add.ptr = getelementptr inbounds i8, i8* %arraydecay1, i64 -8, !dbg !30
  store i8* %add.ptr, i8** %data, align 8, !dbg !31
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !32, metadata !DIExpression()), !dbg !34
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !35
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay2, i8 67, i64 99, i1 false), !dbg !35
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !36
  store i8 0, i8* %arrayidx3, align 1, !dbg !37
  %0 = load i8*, i8** %data, align 8, !dbg !38
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !39
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 1 %0, i8* align 16 %arraydecay4, i64 100, i1 false), !dbg !39
  %1 = load i8*, i8** %data, align 8, !dbg !40
  %arrayidx5 = getelementptr inbounds i8, i8* %1, i64 99, !dbg !40
  store i8 0, i8* %arrayidx5, align 1, !dbg !41
  %2 = load i8*, i8** %data, align 8, !dbg !42
  call void @printLine(i8* %2), !dbg !43
  ret void, !dbg !44
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__char_declare_memmove_06_good() #0 !dbg !45 {
entry:
  call void @goodG2B1(), !dbg !46
  call void @goodG2B2(), !dbg !47
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
  %call = call i64 @time(i64* null) #6, !dbg !58
  %conv = trunc i64 %call to i32, !dbg !59
  call void @srand(i32 %conv) #6, !dbg !60
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !61
  call void @CWE124_Buffer_Underwrite__char_declare_memmove_06_good(), !dbg !62
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !63
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !64
  call void @CWE124_Buffer_Underwrite__char_declare_memmove_06_bad(), !dbg !65
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !66
  ret i32 0, !dbg !67
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !68 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !69, metadata !DIExpression()), !dbg !70
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !71, metadata !DIExpression()), !dbg !72
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !73
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 99, i1 false), !dbg !73
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 99, !dbg !74
  store i8 0, i8* %arrayidx, align 1, !dbg !75
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !76
  store i8* %arraydecay1, i8** %data, align 8, !dbg !79
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !80, metadata !DIExpression()), !dbg !82
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !83
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay2, i8 67, i64 99, i1 false), !dbg !83
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !84
  store i8 0, i8* %arrayidx3, align 1, !dbg !85
  %0 = load i8*, i8** %data, align 8, !dbg !86
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !87
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 1 %0, i8* align 16 %arraydecay4, i64 100, i1 false), !dbg !87
  %1 = load i8*, i8** %data, align 8, !dbg !88
  %arrayidx5 = getelementptr inbounds i8, i8* %1, i64 99, !dbg !88
  store i8 0, i8* %arrayidx5, align 1, !dbg !89
  %2 = load i8*, i8** %data, align 8, !dbg !90
  call void @printLine(i8* %2), !dbg !91
  ret void, !dbg !92
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !93 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !94, metadata !DIExpression()), !dbg !95
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !96, metadata !DIExpression()), !dbg !97
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !98
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 99, i1 false), !dbg !98
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 99, !dbg !99
  store i8 0, i8* %arrayidx, align 1, !dbg !100
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !101
  store i8* %arraydecay1, i8** %data, align 8, !dbg !104
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !105, metadata !DIExpression()), !dbg !107
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !108
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay2, i8 67, i64 99, i1 false), !dbg !108
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !109
  store i8 0, i8* %arrayidx3, align 1, !dbg !110
  %0 = load i8*, i8** %data, align 8, !dbg !111
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !112
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 1 %0, i8* align 16 %arraydecay4, i64 100, i1 false), !dbg !112
  %1 = load i8*, i8** %data, align 8, !dbg !113
  %arrayidx5 = getelementptr inbounds i8, i8* %1, i64 99, !dbg !113
  store i8 0, i8* %arrayidx5, align 1, !dbg !114
  %2 = load i8*, i8** %data, align 8, !dbg !115
  call void @printLine(i8* %2), !dbg !116
  ret void, !dbg !117
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { argmemonly nofree nounwind willreturn }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__char_declare_memmove_06.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__char_declare_memmove_06_bad", scope: !12, file: !12, line: 27, type: !13, scopeLine: 28, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__char_declare_memmove_06.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 29, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!18 = !DILocation(line: 29, column: 12, scope: !11)
!19 = !DILocalVariable(name: "dataBuffer", scope: !11, file: !12, line: 30, type: !20)
!20 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 800, elements: !21)
!21 = !{!22}
!22 = !DISubrange(count: 100)
!23 = !DILocation(line: 30, column: 10, scope: !11)
!24 = !DILocation(line: 31, column: 5, scope: !11)
!25 = !DILocation(line: 32, column: 5, scope: !11)
!26 = !DILocation(line: 32, column: 23, scope: !11)
!27 = !DILocation(line: 36, column: 16, scope: !28)
!28 = distinct !DILexicalBlock(scope: !29, file: !12, line: 34, column: 5)
!29 = distinct !DILexicalBlock(scope: !11, file: !12, line: 33, column: 8)
!30 = !DILocation(line: 36, column: 27, scope: !28)
!31 = !DILocation(line: 36, column: 14, scope: !28)
!32 = !DILocalVariable(name: "source", scope: !33, file: !12, line: 39, type: !20)
!33 = distinct !DILexicalBlock(scope: !11, file: !12, line: 38, column: 5)
!34 = !DILocation(line: 39, column: 14, scope: !33)
!35 = !DILocation(line: 40, column: 9, scope: !33)
!36 = !DILocation(line: 41, column: 9, scope: !33)
!37 = !DILocation(line: 41, column: 23, scope: !33)
!38 = !DILocation(line: 43, column: 17, scope: !33)
!39 = !DILocation(line: 43, column: 9, scope: !33)
!40 = !DILocation(line: 45, column: 9, scope: !33)
!41 = !DILocation(line: 45, column: 21, scope: !33)
!42 = !DILocation(line: 46, column: 19, scope: !33)
!43 = !DILocation(line: 46, column: 9, scope: !33)
!44 = !DILocation(line: 48, column: 1, scope: !11)
!45 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__char_declare_memmove_06_good", scope: !12, file: !12, line: 107, type: !13, scopeLine: 108, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!46 = !DILocation(line: 109, column: 5, scope: !45)
!47 = !DILocation(line: 110, column: 5, scope: !45)
!48 = !DILocation(line: 111, column: 1, scope: !45)
!49 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 123, type: !50, scopeLine: 124, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!50 = !DISubroutineType(types: !51)
!51 = !{!52, !52, !53}
!52 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!53 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!54 = !DILocalVariable(name: "argc", arg: 1, scope: !49, file: !12, line: 123, type: !52)
!55 = !DILocation(line: 123, column: 14, scope: !49)
!56 = !DILocalVariable(name: "argv", arg: 2, scope: !49, file: !12, line: 123, type: !53)
!57 = !DILocation(line: 123, column: 27, scope: !49)
!58 = !DILocation(line: 126, column: 22, scope: !49)
!59 = !DILocation(line: 126, column: 12, scope: !49)
!60 = !DILocation(line: 126, column: 5, scope: !49)
!61 = !DILocation(line: 128, column: 5, scope: !49)
!62 = !DILocation(line: 129, column: 5, scope: !49)
!63 = !DILocation(line: 130, column: 5, scope: !49)
!64 = !DILocation(line: 133, column: 5, scope: !49)
!65 = !DILocation(line: 134, column: 5, scope: !49)
!66 = !DILocation(line: 135, column: 5, scope: !49)
!67 = !DILocation(line: 137, column: 5, scope: !49)
!68 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 55, type: !13, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!69 = !DILocalVariable(name: "data", scope: !68, file: !12, line: 57, type: !16)
!70 = !DILocation(line: 57, column: 12, scope: !68)
!71 = !DILocalVariable(name: "dataBuffer", scope: !68, file: !12, line: 58, type: !20)
!72 = !DILocation(line: 58, column: 10, scope: !68)
!73 = !DILocation(line: 59, column: 5, scope: !68)
!74 = !DILocation(line: 60, column: 5, scope: !68)
!75 = !DILocation(line: 60, column: 23, scope: !68)
!76 = !DILocation(line: 69, column: 16, scope: !77)
!77 = distinct !DILexicalBlock(scope: !78, file: !12, line: 67, column: 5)
!78 = distinct !DILexicalBlock(scope: !68, file: !12, line: 61, column: 8)
!79 = !DILocation(line: 69, column: 14, scope: !77)
!80 = !DILocalVariable(name: "source", scope: !81, file: !12, line: 72, type: !20)
!81 = distinct !DILexicalBlock(scope: !68, file: !12, line: 71, column: 5)
!82 = !DILocation(line: 72, column: 14, scope: !81)
!83 = !DILocation(line: 73, column: 9, scope: !81)
!84 = !DILocation(line: 74, column: 9, scope: !81)
!85 = !DILocation(line: 74, column: 23, scope: !81)
!86 = !DILocation(line: 76, column: 17, scope: !81)
!87 = !DILocation(line: 76, column: 9, scope: !81)
!88 = !DILocation(line: 78, column: 9, scope: !81)
!89 = !DILocation(line: 78, column: 21, scope: !81)
!90 = !DILocation(line: 79, column: 19, scope: !81)
!91 = !DILocation(line: 79, column: 9, scope: !81)
!92 = !DILocation(line: 81, column: 1, scope: !68)
!93 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 84, type: !13, scopeLine: 85, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!94 = !DILocalVariable(name: "data", scope: !93, file: !12, line: 86, type: !16)
!95 = !DILocation(line: 86, column: 12, scope: !93)
!96 = !DILocalVariable(name: "dataBuffer", scope: !93, file: !12, line: 87, type: !20)
!97 = !DILocation(line: 87, column: 10, scope: !93)
!98 = !DILocation(line: 88, column: 5, scope: !93)
!99 = !DILocation(line: 89, column: 5, scope: !93)
!100 = !DILocation(line: 89, column: 23, scope: !93)
!101 = !DILocation(line: 93, column: 16, scope: !102)
!102 = distinct !DILexicalBlock(scope: !103, file: !12, line: 91, column: 5)
!103 = distinct !DILexicalBlock(scope: !93, file: !12, line: 90, column: 8)
!104 = !DILocation(line: 93, column: 14, scope: !102)
!105 = !DILocalVariable(name: "source", scope: !106, file: !12, line: 96, type: !20)
!106 = distinct !DILexicalBlock(scope: !93, file: !12, line: 95, column: 5)
!107 = !DILocation(line: 96, column: 14, scope: !106)
!108 = !DILocation(line: 97, column: 9, scope: !106)
!109 = !DILocation(line: 98, column: 9, scope: !106)
!110 = !DILocation(line: 98, column: 23, scope: !106)
!111 = !DILocation(line: 100, column: 17, scope: !106)
!112 = !DILocation(line: 100, column: 9, scope: !106)
!113 = !DILocation(line: 102, column: 9, scope: !106)
!114 = !DILocation(line: 102, column: 21, scope: !106)
!115 = !DILocation(line: 103, column: 19, scope: !106)
!116 = !DILocation(line: 103, column: 9, scope: !106)
!117 = !DILocation(line: 105, column: 1, scope: !93)
