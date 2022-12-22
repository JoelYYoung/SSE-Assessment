; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__char_declare_memmove_12.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__char_declare_memmove_12.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__char_declare_memmove_12_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !15, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !19, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !24, metadata !DIExpression()), !dbg !28
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !29
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 49, i1 false), !dbg !29
  %arrayidx = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 49, !dbg !30
  store i8 0, i8* %arrayidx, align 1, !dbg !31
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !32
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 65, i64 99, i1 false), !dbg !32
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 99, !dbg !33
  store i8 0, i8* %arrayidx2, align 1, !dbg !34
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !35
  %tobool = icmp ne i32 %call, 0, !dbg !35
  br i1 %tobool, label %if.then, label %if.else, !dbg !37

if.then:                                          ; preds = %entry
  %arraydecay3 = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !38
  store i8* %arraydecay3, i8** %data, align 8, !dbg !40
  br label %if.end, !dbg !41

if.else:                                          ; preds = %entry
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !42
  store i8* %arraydecay4, i8** %data, align 8, !dbg !44
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !45, metadata !DIExpression()), !dbg !47
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !48
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay5, i8 67, i64 99, i1 false), !dbg !48
  %arrayidx6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !49
  store i8 0, i8* %arrayidx6, align 1, !dbg !50
  %arraydecay7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !51
  %0 = load i8*, i8** %data, align 8, !dbg !52
  %arraydecay8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !53
  %call9 = call i64 @strlen(i8* %arraydecay8) #7, !dbg !54
  %mul = mul i64 %call9, 1, !dbg !55
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %arraydecay7, i8* align 1 %0, i64 %mul, i1 false), !dbg !51
  %arrayidx10 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !56
  store i8 0, i8* %arrayidx10, align 1, !dbg !57
  %arraydecay11 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !58
  call void @printLine(i8* %arraydecay11), !dbg !59
  ret void, !dbg !60
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local i32 @globalReturnsTrueOrFalse(...) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #4

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #5

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__char_declare_memmove_12_good() #0 !dbg !61 {
entry:
  call void @goodG2B(), !dbg !62
  ret void, !dbg !63
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !64 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !69, metadata !DIExpression()), !dbg !70
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !71, metadata !DIExpression()), !dbg !72
  %call = call i64 @time(i64* null) #8, !dbg !73
  %conv = trunc i64 %call to i32, !dbg !74
  call void @srand(i32 %conv) #8, !dbg !75
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !76
  call void @CWE126_Buffer_Overread__char_declare_memmove_12_good(), !dbg !77
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !78
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !79
  call void @CWE126_Buffer_Overread__char_declare_memmove_12_bad(), !dbg !80
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !81
  ret i32 0, !dbg !82
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #6

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #6

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !83 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !84, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !86, metadata !DIExpression()), !dbg !87
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !88, metadata !DIExpression()), !dbg !89
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !90
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 49, i1 false), !dbg !90
  %arrayidx = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 49, !dbg !91
  store i8 0, i8* %arrayidx, align 1, !dbg !92
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !93
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 65, i64 99, i1 false), !dbg !93
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 99, !dbg !94
  store i8 0, i8* %arrayidx2, align 1, !dbg !95
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !96
  %tobool = icmp ne i32 %call, 0, !dbg !96
  br i1 %tobool, label %if.then, label %if.else, !dbg !98

if.then:                                          ; preds = %entry
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !99
  store i8* %arraydecay3, i8** %data, align 8, !dbg !101
  br label %if.end, !dbg !102

if.else:                                          ; preds = %entry
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !103
  store i8* %arraydecay4, i8** %data, align 8, !dbg !105
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !106, metadata !DIExpression()), !dbg !108
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !109
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay5, i8 67, i64 99, i1 false), !dbg !109
  %arrayidx6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !110
  store i8 0, i8* %arrayidx6, align 1, !dbg !111
  %arraydecay7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !112
  %0 = load i8*, i8** %data, align 8, !dbg !113
  %arraydecay8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !114
  %call9 = call i64 @strlen(i8* %arraydecay8) #7, !dbg !115
  %mul = mul i64 %call9, 1, !dbg !116
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %arraydecay7, i8* align 1 %0, i64 %mul, i1 false), !dbg !112
  %arrayidx10 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !117
  store i8 0, i8* %arrayidx10, align 1, !dbg !118
  %arraydecay11 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !119
  call void @printLine(i8* %arraydecay11), !dbg !120
  ret void, !dbg !121
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { argmemonly nofree nounwind willreturn }
attributes #6 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind readonly willreturn }
attributes #8 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__char_declare_memmove_12.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_declare_memmove_12_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__char_declare_memmove_12.c", directory: "/root/SSE-Assessment")
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
!29 = !DILocation(line: 28, column: 5, scope: !11)
!30 = !DILocation(line: 29, column: 5, scope: !11)
!31 = !DILocation(line: 29, column: 25, scope: !11)
!32 = !DILocation(line: 30, column: 5, scope: !11)
!33 = !DILocation(line: 31, column: 5, scope: !11)
!34 = !DILocation(line: 31, column: 27, scope: !11)
!35 = !DILocation(line: 32, column: 8, scope: !36)
!36 = distinct !DILexicalBlock(scope: !11, file: !12, line: 32, column: 8)
!37 = !DILocation(line: 32, column: 8, scope: !11)
!38 = !DILocation(line: 35, column: 16, scope: !39)
!39 = distinct !DILexicalBlock(scope: !36, file: !12, line: 33, column: 5)
!40 = !DILocation(line: 35, column: 14, scope: !39)
!41 = !DILocation(line: 36, column: 5, scope: !39)
!42 = !DILocation(line: 40, column: 16, scope: !43)
!43 = distinct !DILexicalBlock(scope: !36, file: !12, line: 38, column: 5)
!44 = !DILocation(line: 40, column: 14, scope: !43)
!45 = !DILocalVariable(name: "dest", scope: !46, file: !12, line: 43, type: !25)
!46 = distinct !DILexicalBlock(scope: !11, file: !12, line: 42, column: 5)
!47 = !DILocation(line: 43, column: 14, scope: !46)
!48 = !DILocation(line: 44, column: 9, scope: !46)
!49 = !DILocation(line: 45, column: 9, scope: !46)
!50 = !DILocation(line: 45, column: 21, scope: !46)
!51 = !DILocation(line: 48, column: 9, scope: !46)
!52 = !DILocation(line: 48, column: 23, scope: !46)
!53 = !DILocation(line: 48, column: 36, scope: !46)
!54 = !DILocation(line: 48, column: 29, scope: !46)
!55 = !DILocation(line: 48, column: 41, scope: !46)
!56 = !DILocation(line: 49, column: 9, scope: !46)
!57 = !DILocation(line: 49, column: 21, scope: !46)
!58 = !DILocation(line: 50, column: 19, scope: !46)
!59 = !DILocation(line: 50, column: 9, scope: !46)
!60 = !DILocation(line: 52, column: 1, scope: !11)
!61 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_declare_memmove_12_good", scope: !12, file: !12, line: 91, type: !13, scopeLine: 92, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!62 = !DILocation(line: 93, column: 5, scope: !61)
!63 = !DILocation(line: 94, column: 1, scope: !61)
!64 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 106, type: !65, scopeLine: 107, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!65 = !DISubroutineType(types: !66)
!66 = !{!67, !67, !68}
!67 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!68 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!69 = !DILocalVariable(name: "argc", arg: 1, scope: !64, file: !12, line: 106, type: !67)
!70 = !DILocation(line: 106, column: 14, scope: !64)
!71 = !DILocalVariable(name: "argv", arg: 2, scope: !64, file: !12, line: 106, type: !68)
!72 = !DILocation(line: 106, column: 27, scope: !64)
!73 = !DILocation(line: 109, column: 22, scope: !64)
!74 = !DILocation(line: 109, column: 12, scope: !64)
!75 = !DILocation(line: 109, column: 5, scope: !64)
!76 = !DILocation(line: 111, column: 5, scope: !64)
!77 = !DILocation(line: 112, column: 5, scope: !64)
!78 = !DILocation(line: 113, column: 5, scope: !64)
!79 = !DILocation(line: 116, column: 5, scope: !64)
!80 = !DILocation(line: 117, column: 5, scope: !64)
!81 = !DILocation(line: 118, column: 5, scope: !64)
!82 = !DILocation(line: 120, column: 5, scope: !64)
!83 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 60, type: !13, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!84 = !DILocalVariable(name: "data", scope: !83, file: !12, line: 62, type: !16)
!85 = !DILocation(line: 62, column: 12, scope: !83)
!86 = !DILocalVariable(name: "dataBadBuffer", scope: !83, file: !12, line: 63, type: !20)
!87 = !DILocation(line: 63, column: 10, scope: !83)
!88 = !DILocalVariable(name: "dataGoodBuffer", scope: !83, file: !12, line: 64, type: !25)
!89 = !DILocation(line: 64, column: 10, scope: !83)
!90 = !DILocation(line: 65, column: 5, scope: !83)
!91 = !DILocation(line: 66, column: 5, scope: !83)
!92 = !DILocation(line: 66, column: 25, scope: !83)
!93 = !DILocation(line: 67, column: 5, scope: !83)
!94 = !DILocation(line: 68, column: 5, scope: !83)
!95 = !DILocation(line: 68, column: 27, scope: !83)
!96 = !DILocation(line: 69, column: 8, scope: !97)
!97 = distinct !DILexicalBlock(scope: !83, file: !12, line: 69, column: 8)
!98 = !DILocation(line: 69, column: 8, scope: !83)
!99 = !DILocation(line: 72, column: 16, scope: !100)
!100 = distinct !DILexicalBlock(scope: !97, file: !12, line: 70, column: 5)
!101 = !DILocation(line: 72, column: 14, scope: !100)
!102 = !DILocation(line: 73, column: 5, scope: !100)
!103 = !DILocation(line: 77, column: 16, scope: !104)
!104 = distinct !DILexicalBlock(scope: !97, file: !12, line: 75, column: 5)
!105 = !DILocation(line: 77, column: 14, scope: !104)
!106 = !DILocalVariable(name: "dest", scope: !107, file: !12, line: 80, type: !25)
!107 = distinct !DILexicalBlock(scope: !83, file: !12, line: 79, column: 5)
!108 = !DILocation(line: 80, column: 14, scope: !107)
!109 = !DILocation(line: 81, column: 9, scope: !107)
!110 = !DILocation(line: 82, column: 9, scope: !107)
!111 = !DILocation(line: 82, column: 21, scope: !107)
!112 = !DILocation(line: 85, column: 9, scope: !107)
!113 = !DILocation(line: 85, column: 23, scope: !107)
!114 = !DILocation(line: 85, column: 36, scope: !107)
!115 = !DILocation(line: 85, column: 29, scope: !107)
!116 = !DILocation(line: 85, column: 41, scope: !107)
!117 = !DILocation(line: 86, column: 9, scope: !107)
!118 = !DILocation(line: 86, column: 21, scope: !107)
!119 = !DILocation(line: 87, column: 19, scope: !107)
!120 = !DILocation(line: 87, column: 9, scope: !107)
!121 = !DILocation(line: 89, column: 1, scope: !83)
