; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_snprintf_12.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_snprintf_12.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_snprintf_12_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !15, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !19, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !24, metadata !DIExpression()), !dbg !28
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !29
  %tobool = icmp ne i32 %call, 0, !dbg !29
  br i1 %tobool, label %if.then, label %if.else, !dbg !31

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !32
  store i8* %arraydecay, i8** %data, align 8, !dbg !34
  %0 = load i8*, i8** %data, align 8, !dbg !35
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 0, !dbg !35
  store i8 0, i8* %arrayidx, align 1, !dbg !36
  br label %if.end, !dbg !37

if.else:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !38
  store i8* %arraydecay1, i8** %data, align 8, !dbg !40
  %1 = load i8*, i8** %data, align 8, !dbg !41
  %arrayidx2 = getelementptr inbounds i8, i8* %1, i64 0, !dbg !41
  store i8 0, i8* %arrayidx2, align 1, !dbg !42
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !43, metadata !DIExpression()), !dbg !45
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !46
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay3, i8 67, i64 99, i1 false), !dbg !46
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !47
  store i8 0, i8* %arrayidx4, align 1, !dbg !48
  %2 = load i8*, i8** %data, align 8, !dbg !49
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !50
  %call6 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* %2, i64 100, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i8* %arraydecay5) #5, !dbg !51
  %3 = load i8*, i8** %data, align 8, !dbg !52
  call void @printLine(i8* %3), !dbg !53
  ret void, !dbg !54
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @globalReturnsTrueOrFalse(...) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nounwind
declare dso_local i32 @snprintf(i8*, i64, i8*, ...) #4

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_snprintf_12_good() #0 !dbg !55 {
entry:
  call void @goodG2B(), !dbg !56
  ret void, !dbg !57
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !58 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !63, metadata !DIExpression()), !dbg !64
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !65, metadata !DIExpression()), !dbg !66
  %call = call i64 @time(i64* null) #5, !dbg !67
  %conv = trunc i64 %call to i32, !dbg !68
  call void @srand(i32 %conv) #5, !dbg !69
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !70
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_snprintf_12_good(), !dbg !71
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !72
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !73
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_snprintf_12_bad(), !dbg !74
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !75
  ret i32 0, !dbg !76
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !77 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !78, metadata !DIExpression()), !dbg !79
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !80, metadata !DIExpression()), !dbg !81
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !82, metadata !DIExpression()), !dbg !83
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !84
  %tobool = icmp ne i32 %call, 0, !dbg !84
  br i1 %tobool, label %if.then, label %if.else, !dbg !86

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !87
  store i8* %arraydecay, i8** %data, align 8, !dbg !89
  %0 = load i8*, i8** %data, align 8, !dbg !90
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 0, !dbg !90
  store i8 0, i8* %arrayidx, align 1, !dbg !91
  br label %if.end, !dbg !92

if.else:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !93
  store i8* %arraydecay1, i8** %data, align 8, !dbg !95
  %1 = load i8*, i8** %data, align 8, !dbg !96
  %arrayidx2 = getelementptr inbounds i8, i8* %1, i64 0, !dbg !96
  store i8 0, i8* %arrayidx2, align 1, !dbg !97
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !98, metadata !DIExpression()), !dbg !100
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !101
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay3, i8 67, i64 99, i1 false), !dbg !101
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !102
  store i8 0, i8* %arrayidx4, align 1, !dbg !103
  %2 = load i8*, i8** %data, align 8, !dbg !104
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !105
  %call6 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* %2, i64 100, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i8* %arraydecay5) #5, !dbg !106
  %3 = load i8*, i8** %data, align 8, !dbg !107
  call void @printLine(i8* %3), !dbg !108
  ret void, !dbg !109
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_snprintf_12.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_snprintf_12_bad", scope: !12, file: !12, line: 29, type: !13, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_snprintf_12.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 31, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!18 = !DILocation(line: 31, column: 12, scope: !11)
!19 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 32, type: !20)
!20 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 400, elements: !21)
!21 = !{!22}
!22 = !DISubrange(count: 50)
!23 = !DILocation(line: 32, column: 10, scope: !11)
!24 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 33, type: !25)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 800, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 100)
!28 = !DILocation(line: 33, column: 10, scope: !11)
!29 = !DILocation(line: 34, column: 8, scope: !30)
!30 = distinct !DILexicalBlock(scope: !11, file: !12, line: 34, column: 8)
!31 = !DILocation(line: 34, column: 8, scope: !11)
!32 = !DILocation(line: 38, column: 16, scope: !33)
!33 = distinct !DILexicalBlock(scope: !30, file: !12, line: 35, column: 5)
!34 = !DILocation(line: 38, column: 14, scope: !33)
!35 = !DILocation(line: 39, column: 9, scope: !33)
!36 = !DILocation(line: 39, column: 17, scope: !33)
!37 = !DILocation(line: 40, column: 5, scope: !33)
!38 = !DILocation(line: 44, column: 16, scope: !39)
!39 = distinct !DILexicalBlock(scope: !30, file: !12, line: 42, column: 5)
!40 = !DILocation(line: 44, column: 14, scope: !39)
!41 = !DILocation(line: 45, column: 9, scope: !39)
!42 = !DILocation(line: 45, column: 17, scope: !39)
!43 = !DILocalVariable(name: "source", scope: !44, file: !12, line: 48, type: !25)
!44 = distinct !DILexicalBlock(scope: !11, file: !12, line: 47, column: 5)
!45 = !DILocation(line: 48, column: 14, scope: !44)
!46 = !DILocation(line: 49, column: 9, scope: !44)
!47 = !DILocation(line: 50, column: 9, scope: !44)
!48 = !DILocation(line: 50, column: 23, scope: !44)
!49 = !DILocation(line: 52, column: 18, scope: !44)
!50 = !DILocation(line: 52, column: 35, scope: !44)
!51 = !DILocation(line: 52, column: 9, scope: !44)
!52 = !DILocation(line: 53, column: 19, scope: !44)
!53 = !DILocation(line: 53, column: 9, scope: !44)
!54 = !DILocation(line: 55, column: 1, scope: !11)
!55 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_snprintf_12_good", scope: !12, file: !12, line: 90, type: !13, scopeLine: 91, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!56 = !DILocation(line: 92, column: 5, scope: !55)
!57 = !DILocation(line: 93, column: 1, scope: !55)
!58 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 105, type: !59, scopeLine: 106, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!59 = !DISubroutineType(types: !60)
!60 = !{!61, !61, !62}
!61 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!62 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!63 = !DILocalVariable(name: "argc", arg: 1, scope: !58, file: !12, line: 105, type: !61)
!64 = !DILocation(line: 105, column: 14, scope: !58)
!65 = !DILocalVariable(name: "argv", arg: 2, scope: !58, file: !12, line: 105, type: !62)
!66 = !DILocation(line: 105, column: 27, scope: !58)
!67 = !DILocation(line: 108, column: 22, scope: !58)
!68 = !DILocation(line: 108, column: 12, scope: !58)
!69 = !DILocation(line: 108, column: 5, scope: !58)
!70 = !DILocation(line: 110, column: 5, scope: !58)
!71 = !DILocation(line: 111, column: 5, scope: !58)
!72 = !DILocation(line: 112, column: 5, scope: !58)
!73 = !DILocation(line: 115, column: 5, scope: !58)
!74 = !DILocation(line: 116, column: 5, scope: !58)
!75 = !DILocation(line: 117, column: 5, scope: !58)
!76 = !DILocation(line: 119, column: 5, scope: !58)
!77 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 63, type: !13, scopeLine: 64, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!78 = !DILocalVariable(name: "data", scope: !77, file: !12, line: 65, type: !16)
!79 = !DILocation(line: 65, column: 12, scope: !77)
!80 = !DILocalVariable(name: "dataBadBuffer", scope: !77, file: !12, line: 66, type: !20)
!81 = !DILocation(line: 66, column: 10, scope: !77)
!82 = !DILocalVariable(name: "dataGoodBuffer", scope: !77, file: !12, line: 67, type: !25)
!83 = !DILocation(line: 67, column: 10, scope: !77)
!84 = !DILocation(line: 68, column: 8, scope: !85)
!85 = distinct !DILexicalBlock(scope: !77, file: !12, line: 68, column: 8)
!86 = !DILocation(line: 68, column: 8, scope: !77)
!87 = !DILocation(line: 71, column: 16, scope: !88)
!88 = distinct !DILexicalBlock(scope: !85, file: !12, line: 69, column: 5)
!89 = !DILocation(line: 71, column: 14, scope: !88)
!90 = !DILocation(line: 72, column: 9, scope: !88)
!91 = !DILocation(line: 72, column: 17, scope: !88)
!92 = !DILocation(line: 73, column: 5, scope: !88)
!93 = !DILocation(line: 77, column: 16, scope: !94)
!94 = distinct !DILexicalBlock(scope: !85, file: !12, line: 75, column: 5)
!95 = !DILocation(line: 77, column: 14, scope: !94)
!96 = !DILocation(line: 78, column: 9, scope: !94)
!97 = !DILocation(line: 78, column: 17, scope: !94)
!98 = !DILocalVariable(name: "source", scope: !99, file: !12, line: 81, type: !25)
!99 = distinct !DILexicalBlock(scope: !77, file: !12, line: 80, column: 5)
!100 = !DILocation(line: 81, column: 14, scope: !99)
!101 = !DILocation(line: 82, column: 9, scope: !99)
!102 = !DILocation(line: 83, column: 9, scope: !99)
!103 = !DILocation(line: 83, column: 23, scope: !99)
!104 = !DILocation(line: 85, column: 18, scope: !99)
!105 = !DILocation(line: 85, column: 35, scope: !99)
!106 = !DILocation(line: 85, column: 9, scope: !99)
!107 = !DILocation(line: 86, column: 19, scope: !99)
!108 = !DILocation(line: 86, column: 9, scope: !99)
!109 = !DILocation(line: 88, column: 1, scope: !77)
