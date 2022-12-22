; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__dest_char_declare_cpy_15.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__dest_char_declare_cpy_15.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__dest_char_declare_cpy_15_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !15, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !19, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !24, metadata !DIExpression()), !dbg !28
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !29
  store i8* %arraydecay, i8** %data, align 8, !dbg !30
  %0 = load i8*, i8** %data, align 8, !dbg !31
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 0, !dbg !31
  store i8 0, i8* %arrayidx, align 1, !dbg !32
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !33, metadata !DIExpression()), !dbg !35
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !36
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 67, i64 99, i1 false), !dbg !36
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !37
  store i8 0, i8* %arrayidx2, align 1, !dbg !38
  %1 = load i8*, i8** %data, align 8, !dbg !39
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !40
  %call = call i8* @strcpy(i8* %1, i8* %arraydecay3) #5, !dbg !41
  %2 = load i8*, i8** %data, align 8, !dbg !42
  call void @printLine(i8* %2), !dbg !43
  ret void, !dbg !44
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__dest_char_declare_cpy_15_good() #0 !dbg !45 {
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
  %call = call i64 @time(i64* null) #5, !dbg !58
  %conv = trunc i64 %call to i32, !dbg !59
  call void @srand(i32 %conv) #5, !dbg !60
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !61
  call void @CWE121_Stack_Based_Buffer_Overflow__dest_char_declare_cpy_15_good(), !dbg !62
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !63
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !64
  call void @CWE121_Stack_Based_Buffer_Overflow__dest_char_declare_cpy_15_bad(), !dbg !65
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !66
  ret i32 0, !dbg !67
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !68 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !69, metadata !DIExpression()), !dbg !70
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !71, metadata !DIExpression()), !dbg !72
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !73, metadata !DIExpression()), !dbg !74
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !75
  store i8* %arraydecay, i8** %data, align 8, !dbg !76
  %0 = load i8*, i8** %data, align 8, !dbg !77
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 0, !dbg !77
  store i8 0, i8* %arrayidx, align 1, !dbg !78
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !79, metadata !DIExpression()), !dbg !81
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !82
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 67, i64 99, i1 false), !dbg !82
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !83
  store i8 0, i8* %arrayidx2, align 1, !dbg !84
  %1 = load i8*, i8** %data, align 8, !dbg !85
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !86
  %call = call i8* @strcpy(i8* %1, i8* %arraydecay3) #5, !dbg !87
  %2 = load i8*, i8** %data, align 8, !dbg !88
  call void @printLine(i8* %2), !dbg !89
  ret void, !dbg !90
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !91 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !92, metadata !DIExpression()), !dbg !93
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !94, metadata !DIExpression()), !dbg !95
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !96, metadata !DIExpression()), !dbg !97
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !98
  store i8* %arraydecay, i8** %data, align 8, !dbg !99
  %0 = load i8*, i8** %data, align 8, !dbg !100
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 0, !dbg !100
  store i8 0, i8* %arrayidx, align 1, !dbg !101
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !102, metadata !DIExpression()), !dbg !104
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !105
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 67, i64 99, i1 false), !dbg !105
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !106
  store i8 0, i8* %arrayidx2, align 1, !dbg !107
  %1 = load i8*, i8** %data, align 8, !dbg !108
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !109
  %call = call i8* @strcpy(i8* %1, i8* %arraydecay3) #5, !dbg !110
  %2 = load i8*, i8** %data, align 8, !dbg !111
  call void @printLine(i8* %2), !dbg !112
  ret void, !dbg !113
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__dest_char_declare_cpy_15.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__dest_char_declare_cpy_15_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__dest_char_declare_cpy_15.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 25, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!18 = !DILocation(line: 25, column: 12, scope: !11)
!19 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 26, type: !20)
!20 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 400, elements: !21)
!21 = !{!22}
!22 = !DISubrange(count: 50)
!23 = !DILocation(line: 26, column: 10, scope: !11)
!24 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 27, type: !25)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 800, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 100)
!28 = !DILocation(line: 27, column: 10, scope: !11)
!29 = !DILocation(line: 33, column: 16, scope: !11)
!30 = !DILocation(line: 33, column: 14, scope: !11)
!31 = !DILocation(line: 34, column: 9, scope: !11)
!32 = !DILocation(line: 34, column: 17, scope: !11)
!33 = !DILocalVariable(name: "source", scope: !34, file: !12, line: 42, type: !25)
!34 = distinct !DILexicalBlock(scope: !11, file: !12, line: 41, column: 5)
!35 = !DILocation(line: 42, column: 14, scope: !34)
!36 = !DILocation(line: 43, column: 9, scope: !34)
!37 = !DILocation(line: 44, column: 9, scope: !34)
!38 = !DILocation(line: 44, column: 23, scope: !34)
!39 = !DILocation(line: 46, column: 16, scope: !34)
!40 = !DILocation(line: 46, column: 22, scope: !34)
!41 = !DILocation(line: 46, column: 9, scope: !34)
!42 = !DILocation(line: 47, column: 19, scope: !34)
!43 = !DILocation(line: 47, column: 9, scope: !34)
!44 = !DILocation(line: 49, column: 1, scope: !11)
!45 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__dest_char_declare_cpy_15_good", scope: !12, file: !12, line: 111, type: !13, scopeLine: 112, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!46 = !DILocation(line: 113, column: 5, scope: !45)
!47 = !DILocation(line: 114, column: 5, scope: !45)
!48 = !DILocation(line: 115, column: 1, scope: !45)
!49 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 127, type: !50, scopeLine: 128, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!50 = !DISubroutineType(types: !51)
!51 = !{!52, !52, !53}
!52 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!53 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!54 = !DILocalVariable(name: "argc", arg: 1, scope: !49, file: !12, line: 127, type: !52)
!55 = !DILocation(line: 127, column: 14, scope: !49)
!56 = !DILocalVariable(name: "argv", arg: 2, scope: !49, file: !12, line: 127, type: !53)
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
!68 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 56, type: !13, scopeLine: 57, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!69 = !DILocalVariable(name: "data", scope: !68, file: !12, line: 58, type: !16)
!70 = !DILocation(line: 58, column: 12, scope: !68)
!71 = !DILocalVariable(name: "dataBadBuffer", scope: !68, file: !12, line: 59, type: !20)
!72 = !DILocation(line: 59, column: 10, scope: !68)
!73 = !DILocalVariable(name: "dataGoodBuffer", scope: !68, file: !12, line: 60, type: !25)
!74 = !DILocation(line: 60, column: 10, scope: !68)
!75 = !DILocation(line: 69, column: 16, scope: !68)
!76 = !DILocation(line: 69, column: 14, scope: !68)
!77 = !DILocation(line: 70, column: 9, scope: !68)
!78 = !DILocation(line: 70, column: 17, scope: !68)
!79 = !DILocalVariable(name: "source", scope: !80, file: !12, line: 74, type: !25)
!80 = distinct !DILexicalBlock(scope: !68, file: !12, line: 73, column: 5)
!81 = !DILocation(line: 74, column: 14, scope: !80)
!82 = !DILocation(line: 75, column: 9, scope: !80)
!83 = !DILocation(line: 76, column: 9, scope: !80)
!84 = !DILocation(line: 76, column: 23, scope: !80)
!85 = !DILocation(line: 78, column: 16, scope: !80)
!86 = !DILocation(line: 78, column: 22, scope: !80)
!87 = !DILocation(line: 78, column: 9, scope: !80)
!88 = !DILocation(line: 79, column: 19, scope: !80)
!89 = !DILocation(line: 79, column: 9, scope: !80)
!90 = !DILocation(line: 81, column: 1, scope: !68)
!91 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 84, type: !13, scopeLine: 85, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!92 = !DILocalVariable(name: "data", scope: !91, file: !12, line: 86, type: !16)
!93 = !DILocation(line: 86, column: 12, scope: !91)
!94 = !DILocalVariable(name: "dataBadBuffer", scope: !91, file: !12, line: 87, type: !20)
!95 = !DILocation(line: 87, column: 10, scope: !91)
!96 = !DILocalVariable(name: "dataGoodBuffer", scope: !91, file: !12, line: 88, type: !25)
!97 = !DILocation(line: 88, column: 10, scope: !91)
!98 = !DILocation(line: 93, column: 16, scope: !91)
!99 = !DILocation(line: 93, column: 14, scope: !91)
!100 = !DILocation(line: 94, column: 9, scope: !91)
!101 = !DILocation(line: 94, column: 17, scope: !91)
!102 = !DILocalVariable(name: "source", scope: !103, file: !12, line: 102, type: !25)
!103 = distinct !DILexicalBlock(scope: !91, file: !12, line: 101, column: 5)
!104 = !DILocation(line: 102, column: 14, scope: !103)
!105 = !DILocation(line: 103, column: 9, scope: !103)
!106 = !DILocation(line: 104, column: 9, scope: !103)
!107 = !DILocation(line: 104, column: 23, scope: !103)
!108 = !DILocation(line: 106, column: 16, scope: !103)
!109 = !DILocation(line: 106, column: 22, scope: !103)
!110 = !DILocation(line: 106, column: 9, scope: !103)
!111 = !DILocation(line: 107, column: 19, scope: !103)
!112 = !DILocation(line: 107, column: 9, scope: !103)
!113 = !DILocation(line: 109, column: 1, scope: !91)
