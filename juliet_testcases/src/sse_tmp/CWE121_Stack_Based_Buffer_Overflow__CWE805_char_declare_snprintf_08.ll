; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_snprintf_08.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_snprintf_08.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_snprintf_08_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !15, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !19, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !24, metadata !DIExpression()), !dbg !28
  %call = call i32 @staticReturnsTrue(), !dbg !29
  %tobool = icmp ne i32 %call, 0, !dbg !29
  br i1 %tobool, label %if.then, label %if.end, !dbg !31

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !32
  store i8* %arraydecay, i8** %data, align 8, !dbg !34
  %0 = load i8*, i8** %data, align 8, !dbg !35
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 0, !dbg !35
  store i8 0, i8* %arrayidx, align 1, !dbg !36
  br label %if.end, !dbg !37

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !38, metadata !DIExpression()), !dbg !40
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !41
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 67, i64 99, i1 false), !dbg !41
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !42
  store i8 0, i8* %arrayidx2, align 1, !dbg !43
  %1 = load i8*, i8** %data, align 8, !dbg !44
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !45
  %call4 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* %1, i64 100, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i8* %arraydecay3) #5, !dbg !46
  %2 = load i8*, i8** %data, align 8, !dbg !47
  call void @printLine(i8* %2), !dbg !48
  ret void, !dbg !49
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i32 @snprintf(i8*, i64, i8*, ...) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_snprintf_08_good() #0 !dbg !50 {
entry:
  call void @goodG2B1(), !dbg !51
  call void @goodG2B2(), !dbg !52
  ret void, !dbg !53
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !54 {
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
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_snprintf_08_good(), !dbg !67
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !68
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !69
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_snprintf_08_bad(), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !71
  ret i32 0, !dbg !72
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !73 {
entry:
  ret i32 1, !dbg !76
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !77 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !78, metadata !DIExpression()), !dbg !79
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !80, metadata !DIExpression()), !dbg !81
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !82, metadata !DIExpression()), !dbg !83
  %call = call i32 @staticReturnsFalse(), !dbg !84
  %tobool = icmp ne i32 %call, 0, !dbg !84
  br i1 %tobool, label %if.then, label %if.else, !dbg !86

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !87
  br label %if.end, !dbg !89

if.else:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !90
  store i8* %arraydecay, i8** %data, align 8, !dbg !92
  %0 = load i8*, i8** %data, align 8, !dbg !93
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 0, !dbg !93
  store i8 0, i8* %arrayidx, align 1, !dbg !94
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !95, metadata !DIExpression()), !dbg !97
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !98
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 67, i64 99, i1 false), !dbg !98
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !99
  store i8 0, i8* %arrayidx2, align 1, !dbg !100
  %1 = load i8*, i8** %data, align 8, !dbg !101
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !102
  %call4 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* %1, i64 100, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i8* %arraydecay3) #5, !dbg !103
  %2 = load i8*, i8** %data, align 8, !dbg !104
  call void @printLine(i8* %2), !dbg !105
  ret void, !dbg !106
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !107 {
entry:
  ret i32 0, !dbg !108
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !109 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !110, metadata !DIExpression()), !dbg !111
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !112, metadata !DIExpression()), !dbg !113
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !114, metadata !DIExpression()), !dbg !115
  %call = call i32 @staticReturnsTrue(), !dbg !116
  %tobool = icmp ne i32 %call, 0, !dbg !116
  br i1 %tobool, label %if.then, label %if.end, !dbg !118

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !119
  store i8* %arraydecay, i8** %data, align 8, !dbg !121
  %0 = load i8*, i8** %data, align 8, !dbg !122
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 0, !dbg !122
  store i8 0, i8* %arrayidx, align 1, !dbg !123
  br label %if.end, !dbg !124

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !125, metadata !DIExpression()), !dbg !127
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !128
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 67, i64 99, i1 false), !dbg !128
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !129
  store i8 0, i8* %arrayidx2, align 1, !dbg !130
  %1 = load i8*, i8** %data, align 8, !dbg !131
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !132
  %call4 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* %1, i64 100, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i8* %arraydecay3) #5, !dbg !133
  %2 = load i8*, i8** %data, align 8, !dbg !134
  call void @printLine(i8* %2), !dbg !135
  ret void, !dbg !136
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_snprintf_08.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_snprintf_08_bad", scope: !12, file: !12, line: 43, type: !13, scopeLine: 44, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_snprintf_08.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 45, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!18 = !DILocation(line: 45, column: 12, scope: !11)
!19 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 46, type: !20)
!20 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 400, elements: !21)
!21 = !{!22}
!22 = !DISubrange(count: 50)
!23 = !DILocation(line: 46, column: 10, scope: !11)
!24 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 47, type: !25)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 800, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 100)
!28 = !DILocation(line: 47, column: 10, scope: !11)
!29 = !DILocation(line: 48, column: 8, scope: !30)
!30 = distinct !DILexicalBlock(scope: !11, file: !12, line: 48, column: 8)
!31 = !DILocation(line: 48, column: 8, scope: !11)
!32 = !DILocation(line: 52, column: 16, scope: !33)
!33 = distinct !DILexicalBlock(scope: !30, file: !12, line: 49, column: 5)
!34 = !DILocation(line: 52, column: 14, scope: !33)
!35 = !DILocation(line: 53, column: 9, scope: !33)
!36 = !DILocation(line: 53, column: 17, scope: !33)
!37 = !DILocation(line: 54, column: 5, scope: !33)
!38 = !DILocalVariable(name: "source", scope: !39, file: !12, line: 56, type: !25)
!39 = distinct !DILexicalBlock(scope: !11, file: !12, line: 55, column: 5)
!40 = !DILocation(line: 56, column: 14, scope: !39)
!41 = !DILocation(line: 57, column: 9, scope: !39)
!42 = !DILocation(line: 58, column: 9, scope: !39)
!43 = !DILocation(line: 58, column: 23, scope: !39)
!44 = !DILocation(line: 60, column: 18, scope: !39)
!45 = !DILocation(line: 60, column: 35, scope: !39)
!46 = !DILocation(line: 60, column: 9, scope: !39)
!47 = !DILocation(line: 61, column: 19, scope: !39)
!48 = !DILocation(line: 61, column: 9, scope: !39)
!49 = !DILocation(line: 63, column: 1, scope: !11)
!50 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_snprintf_08_good", scope: !12, file: !12, line: 118, type: !13, scopeLine: 119, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!51 = !DILocation(line: 120, column: 5, scope: !50)
!52 = !DILocation(line: 121, column: 5, scope: !50)
!53 = !DILocation(line: 122, column: 1, scope: !50)
!54 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 134, type: !55, scopeLine: 135, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!55 = !DISubroutineType(types: !56)
!56 = !{!57, !57, !58}
!57 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!58 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!59 = !DILocalVariable(name: "argc", arg: 1, scope: !54, file: !12, line: 134, type: !57)
!60 = !DILocation(line: 134, column: 14, scope: !54)
!61 = !DILocalVariable(name: "argv", arg: 2, scope: !54, file: !12, line: 134, type: !58)
!62 = !DILocation(line: 134, column: 27, scope: !54)
!63 = !DILocation(line: 137, column: 22, scope: !54)
!64 = !DILocation(line: 137, column: 12, scope: !54)
!65 = !DILocation(line: 137, column: 5, scope: !54)
!66 = !DILocation(line: 139, column: 5, scope: !54)
!67 = !DILocation(line: 140, column: 5, scope: !54)
!68 = !DILocation(line: 141, column: 5, scope: !54)
!69 = !DILocation(line: 144, column: 5, scope: !54)
!70 = !DILocation(line: 145, column: 5, scope: !54)
!71 = !DILocation(line: 146, column: 5, scope: !54)
!72 = !DILocation(line: 148, column: 5, scope: !54)
!73 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !12, file: !12, line: 31, type: !74, scopeLine: 32, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!74 = !DISubroutineType(types: !75)
!75 = !{!57}
!76 = !DILocation(line: 33, column: 5, scope: !73)
!77 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 70, type: !13, scopeLine: 71, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!78 = !DILocalVariable(name: "data", scope: !77, file: !12, line: 72, type: !16)
!79 = !DILocation(line: 72, column: 12, scope: !77)
!80 = !DILocalVariable(name: "dataBadBuffer", scope: !77, file: !12, line: 73, type: !20)
!81 = !DILocation(line: 73, column: 10, scope: !77)
!82 = !DILocalVariable(name: "dataGoodBuffer", scope: !77, file: !12, line: 74, type: !25)
!83 = !DILocation(line: 74, column: 10, scope: !77)
!84 = !DILocation(line: 75, column: 8, scope: !85)
!85 = distinct !DILexicalBlock(scope: !77, file: !12, line: 75, column: 8)
!86 = !DILocation(line: 75, column: 8, scope: !77)
!87 = !DILocation(line: 78, column: 9, scope: !88)
!88 = distinct !DILexicalBlock(scope: !85, file: !12, line: 76, column: 5)
!89 = !DILocation(line: 79, column: 5, scope: !88)
!90 = !DILocation(line: 83, column: 16, scope: !91)
!91 = distinct !DILexicalBlock(scope: !85, file: !12, line: 81, column: 5)
!92 = !DILocation(line: 83, column: 14, scope: !91)
!93 = !DILocation(line: 84, column: 9, scope: !91)
!94 = !DILocation(line: 84, column: 17, scope: !91)
!95 = !DILocalVariable(name: "source", scope: !96, file: !12, line: 87, type: !25)
!96 = distinct !DILexicalBlock(scope: !77, file: !12, line: 86, column: 5)
!97 = !DILocation(line: 87, column: 14, scope: !96)
!98 = !DILocation(line: 88, column: 9, scope: !96)
!99 = !DILocation(line: 89, column: 9, scope: !96)
!100 = !DILocation(line: 89, column: 23, scope: !96)
!101 = !DILocation(line: 91, column: 18, scope: !96)
!102 = !DILocation(line: 91, column: 35, scope: !96)
!103 = !DILocation(line: 91, column: 9, scope: !96)
!104 = !DILocation(line: 92, column: 19, scope: !96)
!105 = !DILocation(line: 92, column: 9, scope: !96)
!106 = !DILocation(line: 94, column: 1, scope: !77)
!107 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !12, file: !12, line: 36, type: !74, scopeLine: 37, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!108 = !DILocation(line: 38, column: 5, scope: !107)
!109 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 97, type: !13, scopeLine: 98, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!110 = !DILocalVariable(name: "data", scope: !109, file: !12, line: 99, type: !16)
!111 = !DILocation(line: 99, column: 12, scope: !109)
!112 = !DILocalVariable(name: "dataBadBuffer", scope: !109, file: !12, line: 100, type: !20)
!113 = !DILocation(line: 100, column: 10, scope: !109)
!114 = !DILocalVariable(name: "dataGoodBuffer", scope: !109, file: !12, line: 101, type: !25)
!115 = !DILocation(line: 101, column: 10, scope: !109)
!116 = !DILocation(line: 102, column: 8, scope: !117)
!117 = distinct !DILexicalBlock(scope: !109, file: !12, line: 102, column: 8)
!118 = !DILocation(line: 102, column: 8, scope: !109)
!119 = !DILocation(line: 105, column: 16, scope: !120)
!120 = distinct !DILexicalBlock(scope: !117, file: !12, line: 103, column: 5)
!121 = !DILocation(line: 105, column: 14, scope: !120)
!122 = !DILocation(line: 106, column: 9, scope: !120)
!123 = !DILocation(line: 106, column: 17, scope: !120)
!124 = !DILocation(line: 107, column: 5, scope: !120)
!125 = !DILocalVariable(name: "source", scope: !126, file: !12, line: 109, type: !25)
!126 = distinct !DILexicalBlock(scope: !109, file: !12, line: 108, column: 5)
!127 = !DILocation(line: 109, column: 14, scope: !126)
!128 = !DILocation(line: 110, column: 9, scope: !126)
!129 = !DILocation(line: 111, column: 9, scope: !126)
!130 = !DILocation(line: 111, column: 23, scope: !126)
!131 = !DILocation(line: 113, column: 18, scope: !126)
!132 = !DILocation(line: 113, column: 35, scope: !126)
!133 = !DILocation(line: 113, column: 9, scope: !126)
!134 = !DILocation(line: 114, column: 19, scope: !126)
!135 = !DILocation(line: 114, column: 9, scope: !126)
!136 = !DILocation(line: 116, column: 1, scope: !109)
