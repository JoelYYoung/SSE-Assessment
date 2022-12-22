; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_15.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_15.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_15_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !15, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !19, metadata !DIExpression()), !dbg !23
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !24
  store i8* %arraydecay, i8** %data, align 8, !dbg !25
  %0 = load i8*, i8** %data, align 8, !dbg !26
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 65, i64 99, i1 false), !dbg !27
  %1 = load i8*, i8** %data, align 8, !dbg !28
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 99, !dbg !28
  store i8 0, i8* %arrayidx, align 1, !dbg !29
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !30, metadata !DIExpression()), !dbg !35
  %2 = bitcast [50 x i8]* %dest to i8*, !dbg !35
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 50, i1 false), !dbg !35
  %arraydecay1 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !36
  %3 = load i8*, i8** %data, align 8, !dbg !37
  %call = call i64 @strlen(i8* %3) #6, !dbg !38
  %4 = load i8*, i8** %data, align 8, !dbg !39
  %call2 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* %arraydecay1, i64 %call, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i8* %4) #7, !dbg !40
  %5 = load i8*, i8** %data, align 8, !dbg !41
  call void @printLine(i8* %5), !dbg !42
  ret void, !dbg !43
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i32 @snprintf(i8*, i64, i8*, ...) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #4

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_15_good() #0 !dbg !44 {
entry:
  call void @goodG2B1(), !dbg !45
  call void @goodG2B2(), !dbg !46
  ret void, !dbg !47
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !48 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !53, metadata !DIExpression()), !dbg !54
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !55, metadata !DIExpression()), !dbg !56
  %call = call i64 @time(i64* null) #7, !dbg !57
  %conv = trunc i64 %call to i32, !dbg !58
  call void @srand(i32 %conv) #7, !dbg !59
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !60
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_15_good(), !dbg !61
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !62
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !63
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_15_bad(), !dbg !64
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !65
  ret i32 0, !dbg !66
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !67 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !68, metadata !DIExpression()), !dbg !69
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !70, metadata !DIExpression()), !dbg !71
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !72
  store i8* %arraydecay, i8** %data, align 8, !dbg !73
  %0 = load i8*, i8** %data, align 8, !dbg !74
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 65, i64 49, i1 false), !dbg !75
  %1 = load i8*, i8** %data, align 8, !dbg !76
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 49, !dbg !76
  store i8 0, i8* %arrayidx, align 1, !dbg !77
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !78, metadata !DIExpression()), !dbg !80
  %2 = bitcast [50 x i8]* %dest to i8*, !dbg !80
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 50, i1 false), !dbg !80
  %arraydecay1 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !81
  %3 = load i8*, i8** %data, align 8, !dbg !82
  %call = call i64 @strlen(i8* %3) #6, !dbg !83
  %4 = load i8*, i8** %data, align 8, !dbg !84
  %call2 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* %arraydecay1, i64 %call, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i8* %4) #7, !dbg !85
  %5 = load i8*, i8** %data, align 8, !dbg !86
  call void @printLine(i8* %5), !dbg !87
  ret void, !dbg !88
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !89 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !90, metadata !DIExpression()), !dbg !91
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !92, metadata !DIExpression()), !dbg !93
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !94
  store i8* %arraydecay, i8** %data, align 8, !dbg !95
  %0 = load i8*, i8** %data, align 8, !dbg !96
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 65, i64 49, i1 false), !dbg !97
  %1 = load i8*, i8** %data, align 8, !dbg !98
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 49, !dbg !98
  store i8 0, i8* %arrayidx, align 1, !dbg !99
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !100, metadata !DIExpression()), !dbg !102
  %2 = bitcast [50 x i8]* %dest to i8*, !dbg !102
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 50, i1 false), !dbg !102
  %arraydecay1 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !103
  %3 = load i8*, i8** %data, align 8, !dbg !104
  %call = call i64 @strlen(i8* %3) #6, !dbg !105
  %4 = load i8*, i8** %data, align 8, !dbg !106
  %call2 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* %arraydecay1, i64 %call, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i8* %4) #7, !dbg !107
  %5 = load i8*, i8** %data, align 8, !dbg !108
  call void @printLine(i8* %5), !dbg !109
  ret void, !dbg !110
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_15.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_15_bad", scope: !12, file: !12, line: 29, type: !13, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_15.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 31, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!18 = !DILocation(line: 31, column: 12, scope: !11)
!19 = !DILocalVariable(name: "dataBuffer", scope: !11, file: !12, line: 32, type: !20)
!20 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 800, elements: !21)
!21 = !{!22}
!22 = !DISubrange(count: 100)
!23 = !DILocation(line: 32, column: 10, scope: !11)
!24 = !DILocation(line: 33, column: 12, scope: !11)
!25 = !DILocation(line: 33, column: 10, scope: !11)
!26 = !DILocation(line: 38, column: 16, scope: !11)
!27 = !DILocation(line: 38, column: 9, scope: !11)
!28 = !DILocation(line: 39, column: 9, scope: !11)
!29 = !DILocation(line: 39, column: 21, scope: !11)
!30 = !DILocalVariable(name: "dest", scope: !31, file: !12, line: 47, type: !32)
!31 = distinct !DILexicalBlock(scope: !11, file: !12, line: 46, column: 5)
!32 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 400, elements: !33)
!33 = !{!34}
!34 = !DISubrange(count: 50)
!35 = !DILocation(line: 47, column: 14, scope: !31)
!36 = !DILocation(line: 49, column: 18, scope: !31)
!37 = !DILocation(line: 49, column: 31, scope: !31)
!38 = !DILocation(line: 49, column: 24, scope: !31)
!39 = !DILocation(line: 49, column: 44, scope: !31)
!40 = !DILocation(line: 49, column: 9, scope: !31)
!41 = !DILocation(line: 50, column: 19, scope: !31)
!42 = !DILocation(line: 50, column: 9, scope: !31)
!43 = !DILocation(line: 52, column: 1, scope: !11)
!44 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_15_good", scope: !12, file: !12, line: 110, type: !13, scopeLine: 111, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!45 = !DILocation(line: 112, column: 5, scope: !44)
!46 = !DILocation(line: 113, column: 5, scope: !44)
!47 = !DILocation(line: 114, column: 1, scope: !44)
!48 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 126, type: !49, scopeLine: 127, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!49 = !DISubroutineType(types: !50)
!50 = !{!51, !51, !52}
!51 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!52 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!53 = !DILocalVariable(name: "argc", arg: 1, scope: !48, file: !12, line: 126, type: !51)
!54 = !DILocation(line: 126, column: 14, scope: !48)
!55 = !DILocalVariable(name: "argv", arg: 2, scope: !48, file: !12, line: 126, type: !52)
!56 = !DILocation(line: 126, column: 27, scope: !48)
!57 = !DILocation(line: 129, column: 22, scope: !48)
!58 = !DILocation(line: 129, column: 12, scope: !48)
!59 = !DILocation(line: 129, column: 5, scope: !48)
!60 = !DILocation(line: 131, column: 5, scope: !48)
!61 = !DILocation(line: 132, column: 5, scope: !48)
!62 = !DILocation(line: 133, column: 5, scope: !48)
!63 = !DILocation(line: 136, column: 5, scope: !48)
!64 = !DILocation(line: 137, column: 5, scope: !48)
!65 = !DILocation(line: 138, column: 5, scope: !48)
!66 = !DILocation(line: 140, column: 5, scope: !48)
!67 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 59, type: !13, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!68 = !DILocalVariable(name: "data", scope: !67, file: !12, line: 61, type: !16)
!69 = !DILocation(line: 61, column: 12, scope: !67)
!70 = !DILocalVariable(name: "dataBuffer", scope: !67, file: !12, line: 62, type: !20)
!71 = !DILocation(line: 62, column: 10, scope: !67)
!72 = !DILocation(line: 63, column: 12, scope: !67)
!73 = !DILocation(line: 63, column: 10, scope: !67)
!74 = !DILocation(line: 72, column: 16, scope: !67)
!75 = !DILocation(line: 72, column: 9, scope: !67)
!76 = !DILocation(line: 73, column: 9, scope: !67)
!77 = !DILocation(line: 73, column: 20, scope: !67)
!78 = !DILocalVariable(name: "dest", scope: !79, file: !12, line: 77, type: !32)
!79 = distinct !DILexicalBlock(scope: !67, file: !12, line: 76, column: 5)
!80 = !DILocation(line: 77, column: 14, scope: !79)
!81 = !DILocation(line: 79, column: 18, scope: !79)
!82 = !DILocation(line: 79, column: 31, scope: !79)
!83 = !DILocation(line: 79, column: 24, scope: !79)
!84 = !DILocation(line: 79, column: 44, scope: !79)
!85 = !DILocation(line: 79, column: 9, scope: !79)
!86 = !DILocation(line: 80, column: 19, scope: !79)
!87 = !DILocation(line: 80, column: 9, scope: !79)
!88 = !DILocation(line: 82, column: 1, scope: !67)
!89 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 85, type: !13, scopeLine: 86, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!90 = !DILocalVariable(name: "data", scope: !89, file: !12, line: 87, type: !16)
!91 = !DILocation(line: 87, column: 12, scope: !89)
!92 = !DILocalVariable(name: "dataBuffer", scope: !89, file: !12, line: 88, type: !20)
!93 = !DILocation(line: 88, column: 10, scope: !89)
!94 = !DILocation(line: 89, column: 12, scope: !89)
!95 = !DILocation(line: 89, column: 10, scope: !89)
!96 = !DILocation(line: 94, column: 16, scope: !89)
!97 = !DILocation(line: 94, column: 9, scope: !89)
!98 = !DILocation(line: 95, column: 9, scope: !89)
!99 = !DILocation(line: 95, column: 20, scope: !89)
!100 = !DILocalVariable(name: "dest", scope: !101, file: !12, line: 103, type: !32)
!101 = distinct !DILexicalBlock(scope: !89, file: !12, line: 102, column: 5)
!102 = !DILocation(line: 103, column: 14, scope: !101)
!103 = !DILocation(line: 105, column: 18, scope: !101)
!104 = !DILocation(line: 105, column: 31, scope: !101)
!105 = !DILocation(line: 105, column: 24, scope: !101)
!106 = !DILocation(line: 105, column: 44, scope: !101)
!107 = !DILocation(line: 105, column: 9, scope: !101)
!108 = !DILocation(line: 106, column: 19, scope: !101)
!109 = !DILocation(line: 106, column: 9, scope: !101)
!110 = !DILocation(line: 108, column: 1, scope: !89)
