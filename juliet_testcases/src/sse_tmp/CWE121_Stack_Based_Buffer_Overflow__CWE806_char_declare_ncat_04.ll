; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncat_04.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncat_04.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncat_04_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !15, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !19, metadata !DIExpression()), !dbg !23
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !24
  store i8* %arraydecay, i8** %data, align 8, !dbg !25
  %0 = load i8*, i8** %data, align 8, !dbg !26
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 65, i64 99, i1 false), !dbg !29
  %1 = load i8*, i8** %data, align 8, !dbg !30
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 99, !dbg !30
  store i8 0, i8* %arrayidx, align 1, !dbg !31
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !32, metadata !DIExpression()), !dbg !37
  %2 = bitcast [50 x i8]* %dest to i8*, !dbg !37
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 50, i1 false), !dbg !37
  %arraydecay1 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !38
  %3 = load i8*, i8** %data, align 8, !dbg !39
  %4 = load i8*, i8** %data, align 8, !dbg !40
  %call = call i64 @strlen(i8* %4) #6, !dbg !41
  %call2 = call i8* @strncat(i8* %arraydecay1, i8* %3, i64 %call) #7, !dbg !42
  %arrayidx3 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !43
  store i8 0, i8* %arrayidx3, align 1, !dbg !44
  %5 = load i8*, i8** %data, align 8, !dbg !45
  call void @printLine(i8* %5), !dbg !46
  ret void, !dbg !47
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i8* @strncat(i8*, i8*, i64) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #4

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncat_04_good() #0 !dbg !48 {
entry:
  call void @goodG2B1(), !dbg !49
  call void @goodG2B2(), !dbg !50
  ret void, !dbg !51
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !52 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !57, metadata !DIExpression()), !dbg !58
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !59, metadata !DIExpression()), !dbg !60
  %call = call i64 @time(i64* null) #7, !dbg !61
  %conv = trunc i64 %call to i32, !dbg !62
  call void @srand(i32 %conv) #7, !dbg !63
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !64
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncat_04_good(), !dbg !65
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !66
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !67
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncat_04_bad(), !dbg !68
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !69
  ret i32 0, !dbg !70
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !71 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !72, metadata !DIExpression()), !dbg !73
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !74, metadata !DIExpression()), !dbg !75
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !76
  store i8* %arraydecay, i8** %data, align 8, !dbg !77
  %0 = load i8*, i8** %data, align 8, !dbg !78
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 65, i64 49, i1 false), !dbg !81
  %1 = load i8*, i8** %data, align 8, !dbg !82
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 49, !dbg !82
  store i8 0, i8* %arrayidx, align 1, !dbg !83
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !84, metadata !DIExpression()), !dbg !86
  %2 = bitcast [50 x i8]* %dest to i8*, !dbg !86
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 50, i1 false), !dbg !86
  %arraydecay1 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !87
  %3 = load i8*, i8** %data, align 8, !dbg !88
  %4 = load i8*, i8** %data, align 8, !dbg !89
  %call = call i64 @strlen(i8* %4) #6, !dbg !90
  %call2 = call i8* @strncat(i8* %arraydecay1, i8* %3, i64 %call) #7, !dbg !91
  %arrayidx3 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !92
  store i8 0, i8* %arrayidx3, align 1, !dbg !93
  %5 = load i8*, i8** %data, align 8, !dbg !94
  call void @printLine(i8* %5), !dbg !95
  ret void, !dbg !96
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !97 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !98, metadata !DIExpression()), !dbg !99
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !100, metadata !DIExpression()), !dbg !101
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !102
  store i8* %arraydecay, i8** %data, align 8, !dbg !103
  %0 = load i8*, i8** %data, align 8, !dbg !104
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 65, i64 49, i1 false), !dbg !107
  %1 = load i8*, i8** %data, align 8, !dbg !108
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 49, !dbg !108
  store i8 0, i8* %arrayidx, align 1, !dbg !109
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !110, metadata !DIExpression()), !dbg !112
  %2 = bitcast [50 x i8]* %dest to i8*, !dbg !112
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 50, i1 false), !dbg !112
  %arraydecay1 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !113
  %3 = load i8*, i8** %data, align 8, !dbg !114
  %4 = load i8*, i8** %data, align 8, !dbg !115
  %call = call i64 @strlen(i8* %4) #6, !dbg !116
  %call2 = call i8* @strncat(i8* %arraydecay1, i8* %3, i64 %call) #7, !dbg !117
  %arrayidx3 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !118
  store i8 0, i8* %arrayidx3, align 1, !dbg !119
  %5 = load i8*, i8** %data, align 8, !dbg !120
  call void @printLine(i8* %5), !dbg !121
  ret void, !dbg !122
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncat_04.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncat_04_bad", scope: !12, file: !12, line: 30, type: !13, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncat_04.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 32, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!18 = !DILocation(line: 32, column: 12, scope: !11)
!19 = !DILocalVariable(name: "dataBuffer", scope: !11, file: !12, line: 33, type: !20)
!20 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 800, elements: !21)
!21 = !{!22}
!22 = !DISubrange(count: 100)
!23 = !DILocation(line: 33, column: 10, scope: !11)
!24 = !DILocation(line: 34, column: 12, scope: !11)
!25 = !DILocation(line: 34, column: 10, scope: !11)
!26 = !DILocation(line: 38, column: 16, scope: !27)
!27 = distinct !DILexicalBlock(scope: !28, file: !12, line: 36, column: 5)
!28 = distinct !DILexicalBlock(scope: !11, file: !12, line: 35, column: 8)
!29 = !DILocation(line: 38, column: 9, scope: !27)
!30 = !DILocation(line: 39, column: 9, scope: !27)
!31 = !DILocation(line: 39, column: 21, scope: !27)
!32 = !DILocalVariable(name: "dest", scope: !33, file: !12, line: 42, type: !34)
!33 = distinct !DILexicalBlock(scope: !11, file: !12, line: 41, column: 5)
!34 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 400, elements: !35)
!35 = !{!36}
!36 = !DISubrange(count: 50)
!37 = !DILocation(line: 42, column: 14, scope: !33)
!38 = !DILocation(line: 44, column: 17, scope: !33)
!39 = !DILocation(line: 44, column: 23, scope: !33)
!40 = !DILocation(line: 44, column: 36, scope: !33)
!41 = !DILocation(line: 44, column: 29, scope: !33)
!42 = !DILocation(line: 44, column: 9, scope: !33)
!43 = !DILocation(line: 45, column: 9, scope: !33)
!44 = !DILocation(line: 45, column: 20, scope: !33)
!45 = !DILocation(line: 46, column: 19, scope: !33)
!46 = !DILocation(line: 46, column: 9, scope: !33)
!47 = !DILocation(line: 48, column: 1, scope: !11)
!48 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncat_04_good", scope: !12, file: !12, line: 101, type: !13, scopeLine: 102, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!49 = !DILocation(line: 103, column: 5, scope: !48)
!50 = !DILocation(line: 104, column: 5, scope: !48)
!51 = !DILocation(line: 105, column: 1, scope: !48)
!52 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 117, type: !53, scopeLine: 118, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!53 = !DISubroutineType(types: !54)
!54 = !{!55, !55, !56}
!55 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!56 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!57 = !DILocalVariable(name: "argc", arg: 1, scope: !52, file: !12, line: 117, type: !55)
!58 = !DILocation(line: 117, column: 14, scope: !52)
!59 = !DILocalVariable(name: "argv", arg: 2, scope: !52, file: !12, line: 117, type: !56)
!60 = !DILocation(line: 117, column: 27, scope: !52)
!61 = !DILocation(line: 120, column: 22, scope: !52)
!62 = !DILocation(line: 120, column: 12, scope: !52)
!63 = !DILocation(line: 120, column: 5, scope: !52)
!64 = !DILocation(line: 122, column: 5, scope: !52)
!65 = !DILocation(line: 123, column: 5, scope: !52)
!66 = !DILocation(line: 124, column: 5, scope: !52)
!67 = !DILocation(line: 127, column: 5, scope: !52)
!68 = !DILocation(line: 128, column: 5, scope: !52)
!69 = !DILocation(line: 129, column: 5, scope: !52)
!70 = !DILocation(line: 131, column: 5, scope: !52)
!71 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 55, type: !13, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!72 = !DILocalVariable(name: "data", scope: !71, file: !12, line: 57, type: !16)
!73 = !DILocation(line: 57, column: 12, scope: !71)
!74 = !DILocalVariable(name: "dataBuffer", scope: !71, file: !12, line: 58, type: !20)
!75 = !DILocation(line: 58, column: 10, scope: !71)
!76 = !DILocation(line: 59, column: 12, scope: !71)
!77 = !DILocation(line: 59, column: 10, scope: !71)
!78 = !DILocation(line: 68, column: 16, scope: !79)
!79 = distinct !DILexicalBlock(scope: !80, file: !12, line: 66, column: 5)
!80 = distinct !DILexicalBlock(scope: !71, file: !12, line: 60, column: 8)
!81 = !DILocation(line: 68, column: 9, scope: !79)
!82 = !DILocation(line: 69, column: 9, scope: !79)
!83 = !DILocation(line: 69, column: 20, scope: !79)
!84 = !DILocalVariable(name: "dest", scope: !85, file: !12, line: 72, type: !34)
!85 = distinct !DILexicalBlock(scope: !71, file: !12, line: 71, column: 5)
!86 = !DILocation(line: 72, column: 14, scope: !85)
!87 = !DILocation(line: 74, column: 17, scope: !85)
!88 = !DILocation(line: 74, column: 23, scope: !85)
!89 = !DILocation(line: 74, column: 36, scope: !85)
!90 = !DILocation(line: 74, column: 29, scope: !85)
!91 = !DILocation(line: 74, column: 9, scope: !85)
!92 = !DILocation(line: 75, column: 9, scope: !85)
!93 = !DILocation(line: 75, column: 20, scope: !85)
!94 = !DILocation(line: 76, column: 19, scope: !85)
!95 = !DILocation(line: 76, column: 9, scope: !85)
!96 = !DILocation(line: 78, column: 1, scope: !71)
!97 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 81, type: !13, scopeLine: 82, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!98 = !DILocalVariable(name: "data", scope: !97, file: !12, line: 83, type: !16)
!99 = !DILocation(line: 83, column: 12, scope: !97)
!100 = !DILocalVariable(name: "dataBuffer", scope: !97, file: !12, line: 84, type: !20)
!101 = !DILocation(line: 84, column: 10, scope: !97)
!102 = !DILocation(line: 85, column: 12, scope: !97)
!103 = !DILocation(line: 85, column: 10, scope: !97)
!104 = !DILocation(line: 89, column: 16, scope: !105)
!105 = distinct !DILexicalBlock(scope: !106, file: !12, line: 87, column: 5)
!106 = distinct !DILexicalBlock(scope: !97, file: !12, line: 86, column: 8)
!107 = !DILocation(line: 89, column: 9, scope: !105)
!108 = !DILocation(line: 90, column: 9, scope: !105)
!109 = !DILocation(line: 90, column: 20, scope: !105)
!110 = !DILocalVariable(name: "dest", scope: !111, file: !12, line: 93, type: !34)
!111 = distinct !DILexicalBlock(scope: !97, file: !12, line: 92, column: 5)
!112 = !DILocation(line: 93, column: 14, scope: !111)
!113 = !DILocation(line: 95, column: 17, scope: !111)
!114 = !DILocation(line: 95, column: 23, scope: !111)
!115 = !DILocation(line: 95, column: 36, scope: !111)
!116 = !DILocation(line: 95, column: 29, scope: !111)
!117 = !DILocation(line: 95, column: 9, scope: !111)
!118 = !DILocation(line: 96, column: 9, scope: !111)
!119 = !DILocation(line: 96, column: 20, scope: !111)
!120 = !DILocation(line: 97, column: 19, scope: !111)
!121 = !DILocation(line: 97, column: 9, scope: !111)
!122 = !DILocation(line: 99, column: 1, scope: !97)
