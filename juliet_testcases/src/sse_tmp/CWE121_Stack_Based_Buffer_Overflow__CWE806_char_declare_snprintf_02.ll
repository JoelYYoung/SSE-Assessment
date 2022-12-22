; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_02.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_02.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_02_bad() #0 !dbg !11 {
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
  %call = call i64 @strlen(i8* %3) #6, !dbg !40
  %4 = load i8*, i8** %data, align 8, !dbg !41
  %call2 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* %arraydecay1, i64 %call, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i8* %4) #7, !dbg !42
  %5 = load i8*, i8** %data, align 8, !dbg !43
  call void @printLine(i8* %5), !dbg !44
  ret void, !dbg !45
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
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_02_good() #0 !dbg !46 {
entry:
  call void @goodG2B1(), !dbg !47
  call void @goodG2B2(), !dbg !48
  ret void, !dbg !49
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !50 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !55, metadata !DIExpression()), !dbg !56
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !57, metadata !DIExpression()), !dbg !58
  %call = call i64 @time(i64* null) #7, !dbg !59
  %conv = trunc i64 %call to i32, !dbg !60
  call void @srand(i32 %conv) #7, !dbg !61
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !62
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_02_good(), !dbg !63
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !64
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !65
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_02_bad(), !dbg !66
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !67
  ret i32 0, !dbg !68
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !69 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !70, metadata !DIExpression()), !dbg !71
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !72, metadata !DIExpression()), !dbg !73
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !74
  store i8* %arraydecay, i8** %data, align 8, !dbg !75
  %0 = load i8*, i8** %data, align 8, !dbg !76
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 65, i64 49, i1 false), !dbg !79
  %1 = load i8*, i8** %data, align 8, !dbg !80
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 49, !dbg !80
  store i8 0, i8* %arrayidx, align 1, !dbg !81
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !82, metadata !DIExpression()), !dbg !84
  %2 = bitcast [50 x i8]* %dest to i8*, !dbg !84
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 50, i1 false), !dbg !84
  %arraydecay1 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !85
  %3 = load i8*, i8** %data, align 8, !dbg !86
  %call = call i64 @strlen(i8* %3) #6, !dbg !87
  %4 = load i8*, i8** %data, align 8, !dbg !88
  %call2 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* %arraydecay1, i64 %call, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i8* %4) #7, !dbg !89
  %5 = load i8*, i8** %data, align 8, !dbg !90
  call void @printLine(i8* %5), !dbg !91
  ret void, !dbg !92
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !93 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !94, metadata !DIExpression()), !dbg !95
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !96, metadata !DIExpression()), !dbg !97
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !98
  store i8* %arraydecay, i8** %data, align 8, !dbg !99
  %0 = load i8*, i8** %data, align 8, !dbg !100
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 65, i64 49, i1 false), !dbg !103
  %1 = load i8*, i8** %data, align 8, !dbg !104
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 49, !dbg !104
  store i8 0, i8* %arrayidx, align 1, !dbg !105
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !106, metadata !DIExpression()), !dbg !108
  %2 = bitcast [50 x i8]* %dest to i8*, !dbg !108
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 50, i1 false), !dbg !108
  %arraydecay1 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !109
  %3 = load i8*, i8** %data, align 8, !dbg !110
  %call = call i64 @strlen(i8* %3) #6, !dbg !111
  %4 = load i8*, i8** %data, align 8, !dbg !112
  %call2 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* %arraydecay1, i64 %call, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i8* %4) #7, !dbg !113
  %5 = load i8*, i8** %data, align 8, !dbg !114
  call void @printLine(i8* %5), !dbg !115
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_02.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_02_bad", scope: !12, file: !12, line: 29, type: !13, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_02.c", directory: "/root/SSE-Assessment")
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
!26 = !DILocation(line: 37, column: 16, scope: !27)
!27 = distinct !DILexicalBlock(scope: !28, file: !12, line: 35, column: 5)
!28 = distinct !DILexicalBlock(scope: !11, file: !12, line: 34, column: 8)
!29 = !DILocation(line: 37, column: 9, scope: !27)
!30 = !DILocation(line: 38, column: 9, scope: !27)
!31 = !DILocation(line: 38, column: 21, scope: !27)
!32 = !DILocalVariable(name: "dest", scope: !33, file: !12, line: 41, type: !34)
!33 = distinct !DILexicalBlock(scope: !11, file: !12, line: 40, column: 5)
!34 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 400, elements: !35)
!35 = !{!36}
!36 = !DISubrange(count: 50)
!37 = !DILocation(line: 41, column: 14, scope: !33)
!38 = !DILocation(line: 43, column: 18, scope: !33)
!39 = !DILocation(line: 43, column: 31, scope: !33)
!40 = !DILocation(line: 43, column: 24, scope: !33)
!41 = !DILocation(line: 43, column: 44, scope: !33)
!42 = !DILocation(line: 43, column: 9, scope: !33)
!43 = !DILocation(line: 44, column: 19, scope: !33)
!44 = !DILocation(line: 44, column: 9, scope: !33)
!45 = !DILocation(line: 46, column: 1, scope: !11)
!46 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_02_good", scope: !12, file: !12, line: 97, type: !13, scopeLine: 98, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!47 = !DILocation(line: 99, column: 5, scope: !46)
!48 = !DILocation(line: 100, column: 5, scope: !46)
!49 = !DILocation(line: 101, column: 1, scope: !46)
!50 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 113, type: !51, scopeLine: 114, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!51 = !DISubroutineType(types: !52)
!52 = !{!53, !53, !54}
!53 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!54 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!55 = !DILocalVariable(name: "argc", arg: 1, scope: !50, file: !12, line: 113, type: !53)
!56 = !DILocation(line: 113, column: 14, scope: !50)
!57 = !DILocalVariable(name: "argv", arg: 2, scope: !50, file: !12, line: 113, type: !54)
!58 = !DILocation(line: 113, column: 27, scope: !50)
!59 = !DILocation(line: 116, column: 22, scope: !50)
!60 = !DILocation(line: 116, column: 12, scope: !50)
!61 = !DILocation(line: 116, column: 5, scope: !50)
!62 = !DILocation(line: 118, column: 5, scope: !50)
!63 = !DILocation(line: 119, column: 5, scope: !50)
!64 = !DILocation(line: 120, column: 5, scope: !50)
!65 = !DILocation(line: 123, column: 5, scope: !50)
!66 = !DILocation(line: 124, column: 5, scope: !50)
!67 = !DILocation(line: 125, column: 5, scope: !50)
!68 = !DILocation(line: 127, column: 5, scope: !50)
!69 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 53, type: !13, scopeLine: 54, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!70 = !DILocalVariable(name: "data", scope: !69, file: !12, line: 55, type: !16)
!71 = !DILocation(line: 55, column: 12, scope: !69)
!72 = !DILocalVariable(name: "dataBuffer", scope: !69, file: !12, line: 56, type: !20)
!73 = !DILocation(line: 56, column: 10, scope: !69)
!74 = !DILocation(line: 57, column: 12, scope: !69)
!75 = !DILocation(line: 57, column: 10, scope: !69)
!76 = !DILocation(line: 66, column: 16, scope: !77)
!77 = distinct !DILexicalBlock(scope: !78, file: !12, line: 64, column: 5)
!78 = distinct !DILexicalBlock(scope: !69, file: !12, line: 58, column: 8)
!79 = !DILocation(line: 66, column: 9, scope: !77)
!80 = !DILocation(line: 67, column: 9, scope: !77)
!81 = !DILocation(line: 67, column: 20, scope: !77)
!82 = !DILocalVariable(name: "dest", scope: !83, file: !12, line: 70, type: !34)
!83 = distinct !DILexicalBlock(scope: !69, file: !12, line: 69, column: 5)
!84 = !DILocation(line: 70, column: 14, scope: !83)
!85 = !DILocation(line: 72, column: 18, scope: !83)
!86 = !DILocation(line: 72, column: 31, scope: !83)
!87 = !DILocation(line: 72, column: 24, scope: !83)
!88 = !DILocation(line: 72, column: 44, scope: !83)
!89 = !DILocation(line: 72, column: 9, scope: !83)
!90 = !DILocation(line: 73, column: 19, scope: !83)
!91 = !DILocation(line: 73, column: 9, scope: !83)
!92 = !DILocation(line: 75, column: 1, scope: !69)
!93 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 78, type: !13, scopeLine: 79, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!94 = !DILocalVariable(name: "data", scope: !93, file: !12, line: 80, type: !16)
!95 = !DILocation(line: 80, column: 12, scope: !93)
!96 = !DILocalVariable(name: "dataBuffer", scope: !93, file: !12, line: 81, type: !20)
!97 = !DILocation(line: 81, column: 10, scope: !93)
!98 = !DILocation(line: 82, column: 12, scope: !93)
!99 = !DILocation(line: 82, column: 10, scope: !93)
!100 = !DILocation(line: 86, column: 16, scope: !101)
!101 = distinct !DILexicalBlock(scope: !102, file: !12, line: 84, column: 5)
!102 = distinct !DILexicalBlock(scope: !93, file: !12, line: 83, column: 8)
!103 = !DILocation(line: 86, column: 9, scope: !101)
!104 = !DILocation(line: 87, column: 9, scope: !101)
!105 = !DILocation(line: 87, column: 20, scope: !101)
!106 = !DILocalVariable(name: "dest", scope: !107, file: !12, line: 90, type: !34)
!107 = distinct !DILexicalBlock(scope: !93, file: !12, line: 89, column: 5)
!108 = !DILocation(line: 90, column: 14, scope: !107)
!109 = !DILocation(line: 92, column: 18, scope: !107)
!110 = !DILocation(line: 92, column: 31, scope: !107)
!111 = !DILocation(line: 92, column: 24, scope: !107)
!112 = !DILocation(line: 92, column: 44, scope: !107)
!113 = !DILocation(line: 92, column: 9, scope: !107)
!114 = !DILocation(line: 93, column: 19, scope: !107)
!115 = !DILocation(line: 93, column: 9, scope: !107)
!116 = !DILocation(line: 95, column: 1, scope: !93)
