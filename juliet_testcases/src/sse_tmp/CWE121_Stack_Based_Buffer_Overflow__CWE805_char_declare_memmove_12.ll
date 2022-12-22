; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_memmove_12.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_memmove_12.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_memmove_12_bad() #0 !dbg !11 {
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
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 1 %2, i8* align 16 %arraydecay5, i64 100, i1 false), !dbg !50
  %3 = load i8*, i8** %data, align 8, !dbg !51
  %arrayidx6 = getelementptr inbounds i8, i8* %3, i64 99, !dbg !51
  store i8 0, i8* %arrayidx6, align 1, !dbg !52
  %4 = load i8*, i8** %data, align 8, !dbg !53
  call void @printLine(i8* %4), !dbg !54
  ret void, !dbg !55
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @globalReturnsTrueOrFalse(...) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #4

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_memmove_12_good() #0 !dbg !56 {
entry:
  call void @goodG2B(), !dbg !57
  ret void, !dbg !58
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !59 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !64, metadata !DIExpression()), !dbg !65
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !66, metadata !DIExpression()), !dbg !67
  %call = call i64 @time(i64* null) #6, !dbg !68
  %conv = trunc i64 %call to i32, !dbg !69
  call void @srand(i32 %conv) #6, !dbg !70
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !71
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_memmove_12_good(), !dbg !72
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !73
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !74
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_memmove_12_bad(), !dbg !75
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !76
  ret i32 0, !dbg !77
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !78 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !79, metadata !DIExpression()), !dbg !80
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !81, metadata !DIExpression()), !dbg !82
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !83, metadata !DIExpression()), !dbg !84
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !85
  %tobool = icmp ne i32 %call, 0, !dbg !85
  br i1 %tobool, label %if.then, label %if.else, !dbg !87

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !88
  store i8* %arraydecay, i8** %data, align 8, !dbg !90
  %0 = load i8*, i8** %data, align 8, !dbg !91
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 0, !dbg !91
  store i8 0, i8* %arrayidx, align 1, !dbg !92
  br label %if.end, !dbg !93

if.else:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !94
  store i8* %arraydecay1, i8** %data, align 8, !dbg !96
  %1 = load i8*, i8** %data, align 8, !dbg !97
  %arrayidx2 = getelementptr inbounds i8, i8* %1, i64 0, !dbg !97
  store i8 0, i8* %arrayidx2, align 1, !dbg !98
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !99, metadata !DIExpression()), !dbg !101
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !102
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay3, i8 67, i64 99, i1 false), !dbg !102
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !103
  store i8 0, i8* %arrayidx4, align 1, !dbg !104
  %2 = load i8*, i8** %data, align 8, !dbg !105
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !106
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 1 %2, i8* align 16 %arraydecay5, i64 100, i1 false), !dbg !106
  %3 = load i8*, i8** %data, align 8, !dbg !107
  %arrayidx6 = getelementptr inbounds i8, i8* %3, i64 99, !dbg !107
  store i8 0, i8* %arrayidx6, align 1, !dbg !108
  %4 = load i8*, i8** %data, align 8, !dbg !109
  call void @printLine(i8* %4), !dbg !110
  ret void, !dbg !111
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { argmemonly nofree nounwind willreturn }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_memmove_12.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_memmove_12_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_memmove_12.c", directory: "/root/SSE-Assessment")
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
!29 = !DILocation(line: 28, column: 8, scope: !30)
!30 = distinct !DILexicalBlock(scope: !11, file: !12, line: 28, column: 8)
!31 = !DILocation(line: 28, column: 8, scope: !11)
!32 = !DILocation(line: 32, column: 16, scope: !33)
!33 = distinct !DILexicalBlock(scope: !30, file: !12, line: 29, column: 5)
!34 = !DILocation(line: 32, column: 14, scope: !33)
!35 = !DILocation(line: 33, column: 9, scope: !33)
!36 = !DILocation(line: 33, column: 17, scope: !33)
!37 = !DILocation(line: 34, column: 5, scope: !33)
!38 = !DILocation(line: 38, column: 16, scope: !39)
!39 = distinct !DILexicalBlock(scope: !30, file: !12, line: 36, column: 5)
!40 = !DILocation(line: 38, column: 14, scope: !39)
!41 = !DILocation(line: 39, column: 9, scope: !39)
!42 = !DILocation(line: 39, column: 17, scope: !39)
!43 = !DILocalVariable(name: "source", scope: !44, file: !12, line: 42, type: !25)
!44 = distinct !DILexicalBlock(scope: !11, file: !12, line: 41, column: 5)
!45 = !DILocation(line: 42, column: 14, scope: !44)
!46 = !DILocation(line: 43, column: 9, scope: !44)
!47 = !DILocation(line: 44, column: 9, scope: !44)
!48 = !DILocation(line: 44, column: 23, scope: !44)
!49 = !DILocation(line: 46, column: 17, scope: !44)
!50 = !DILocation(line: 46, column: 9, scope: !44)
!51 = !DILocation(line: 47, column: 9, scope: !44)
!52 = !DILocation(line: 47, column: 21, scope: !44)
!53 = !DILocation(line: 48, column: 19, scope: !44)
!54 = !DILocation(line: 48, column: 9, scope: !44)
!55 = !DILocation(line: 50, column: 1, scope: !11)
!56 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_memmove_12_good", scope: !12, file: !12, line: 86, type: !13, scopeLine: 87, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!57 = !DILocation(line: 88, column: 5, scope: !56)
!58 = !DILocation(line: 89, column: 1, scope: !56)
!59 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 101, type: !60, scopeLine: 102, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!60 = !DISubroutineType(types: !61)
!61 = !{!62, !62, !63}
!62 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!63 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!64 = !DILocalVariable(name: "argc", arg: 1, scope: !59, file: !12, line: 101, type: !62)
!65 = !DILocation(line: 101, column: 14, scope: !59)
!66 = !DILocalVariable(name: "argv", arg: 2, scope: !59, file: !12, line: 101, type: !63)
!67 = !DILocation(line: 101, column: 27, scope: !59)
!68 = !DILocation(line: 104, column: 22, scope: !59)
!69 = !DILocation(line: 104, column: 12, scope: !59)
!70 = !DILocation(line: 104, column: 5, scope: !59)
!71 = !DILocation(line: 106, column: 5, scope: !59)
!72 = !DILocation(line: 107, column: 5, scope: !59)
!73 = !DILocation(line: 108, column: 5, scope: !59)
!74 = !DILocation(line: 111, column: 5, scope: !59)
!75 = !DILocation(line: 112, column: 5, scope: !59)
!76 = !DILocation(line: 113, column: 5, scope: !59)
!77 = !DILocation(line: 115, column: 5, scope: !59)
!78 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 58, type: !13, scopeLine: 59, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!79 = !DILocalVariable(name: "data", scope: !78, file: !12, line: 60, type: !16)
!80 = !DILocation(line: 60, column: 12, scope: !78)
!81 = !DILocalVariable(name: "dataBadBuffer", scope: !78, file: !12, line: 61, type: !20)
!82 = !DILocation(line: 61, column: 10, scope: !78)
!83 = !DILocalVariable(name: "dataGoodBuffer", scope: !78, file: !12, line: 62, type: !25)
!84 = !DILocation(line: 62, column: 10, scope: !78)
!85 = !DILocation(line: 63, column: 8, scope: !86)
!86 = distinct !DILexicalBlock(scope: !78, file: !12, line: 63, column: 8)
!87 = !DILocation(line: 63, column: 8, scope: !78)
!88 = !DILocation(line: 66, column: 16, scope: !89)
!89 = distinct !DILexicalBlock(scope: !86, file: !12, line: 64, column: 5)
!90 = !DILocation(line: 66, column: 14, scope: !89)
!91 = !DILocation(line: 67, column: 9, scope: !89)
!92 = !DILocation(line: 67, column: 17, scope: !89)
!93 = !DILocation(line: 68, column: 5, scope: !89)
!94 = !DILocation(line: 72, column: 16, scope: !95)
!95 = distinct !DILexicalBlock(scope: !86, file: !12, line: 70, column: 5)
!96 = !DILocation(line: 72, column: 14, scope: !95)
!97 = !DILocation(line: 73, column: 9, scope: !95)
!98 = !DILocation(line: 73, column: 17, scope: !95)
!99 = !DILocalVariable(name: "source", scope: !100, file: !12, line: 76, type: !25)
!100 = distinct !DILexicalBlock(scope: !78, file: !12, line: 75, column: 5)
!101 = !DILocation(line: 76, column: 14, scope: !100)
!102 = !DILocation(line: 77, column: 9, scope: !100)
!103 = !DILocation(line: 78, column: 9, scope: !100)
!104 = !DILocation(line: 78, column: 23, scope: !100)
!105 = !DILocation(line: 80, column: 17, scope: !100)
!106 = !DILocation(line: 80, column: 9, scope: !100)
!107 = !DILocation(line: 81, column: 9, scope: !100)
!108 = !DILocation(line: 81, column: 21, scope: !100)
!109 = !DILocation(line: 82, column: 19, scope: !100)
!110 = !DILocation(line: 82, column: 9, scope: !100)
!111 = !DILocation(line: 84, column: 1, scope: !78)
