; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__char_declare_memmove_44.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__char_declare_memmove_44.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__char_declare_memmove_44_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  %funcPtr = alloca void (i8*)*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !15, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata void (i8*)** %funcPtr, metadata !19, metadata !DIExpression()), !dbg !23
  store void (i8*)* @badSink, void (i8*)** %funcPtr, align 8, !dbg !23
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !24, metadata !DIExpression()), !dbg !28
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !29, metadata !DIExpression()), !dbg !33
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !34
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 49, i1 false), !dbg !34
  %arrayidx = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 49, !dbg !35
  store i8 0, i8* %arrayidx, align 1, !dbg !36
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !37
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 65, i64 99, i1 false), !dbg !37
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 99, !dbg !38
  store i8 0, i8* %arrayidx2, align 1, !dbg !39
  %arraydecay3 = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !40
  store i8* %arraydecay3, i8** %data, align 8, !dbg !41
  %0 = load void (i8*)*, void (i8*)** %funcPtr, align 8, !dbg !42
  %1 = load i8*, i8** %data, align 8, !dbg !43
  call void %0(i8* %1), !dbg !42
  ret void, !dbg !44
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal void @badSink(i8* %data) #0 !dbg !45 {
entry:
  %data.addr = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !46, metadata !DIExpression()), !dbg !47
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !48, metadata !DIExpression()), !dbg !50
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !51
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !51
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !52
  store i8 0, i8* %arrayidx, align 1, !dbg !53
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !54
  %0 = load i8*, i8** %data.addr, align 8, !dbg !55
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !56
  %call = call i64 @strlen(i8* %arraydecay2) #7, !dbg !57
  %mul = mul i64 %call, 1, !dbg !58
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %arraydecay1, i8* align 1 %0, i64 %mul, i1 false), !dbg !54
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !59
  store i8 0, i8* %arrayidx3, align 1, !dbg !60
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !61
  call void @printLine(i8* %arraydecay4), !dbg !62
  ret void, !dbg !63
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__char_declare_memmove_44_good() #0 !dbg !64 {
entry:
  call void @goodG2B(), !dbg !65
  ret void, !dbg !66
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !67 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !72, metadata !DIExpression()), !dbg !73
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !74, metadata !DIExpression()), !dbg !75
  %call = call i64 @time(i64* null) #8, !dbg !76
  %conv = trunc i64 %call to i32, !dbg !77
  call void @srand(i32 %conv) #8, !dbg !78
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !79
  call void @CWE126_Buffer_Overread__char_declare_memmove_44_good(), !dbg !80
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !81
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !82
  call void @CWE126_Buffer_Overread__char_declare_memmove_44_bad(), !dbg !83
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !84
  ret i32 0, !dbg !85
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #5

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #6

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !86 {
entry:
  %data = alloca i8*, align 8
  %funcPtr = alloca void (i8*)*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !87, metadata !DIExpression()), !dbg !88
  call void @llvm.dbg.declare(metadata void (i8*)** %funcPtr, metadata !89, metadata !DIExpression()), !dbg !90
  store void (i8*)* @goodG2BSink, void (i8*)** %funcPtr, align 8, !dbg !90
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !91, metadata !DIExpression()), !dbg !92
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !93, metadata !DIExpression()), !dbg !94
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !95
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 49, i1 false), !dbg !95
  %arrayidx = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 49, !dbg !96
  store i8 0, i8* %arrayidx, align 1, !dbg !97
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !98
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 65, i64 99, i1 false), !dbg !98
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 99, !dbg !99
  store i8 0, i8* %arrayidx2, align 1, !dbg !100
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !101
  store i8* %arraydecay3, i8** %data, align 8, !dbg !102
  %0 = load void (i8*)*, void (i8*)** %funcPtr, align 8, !dbg !103
  %1 = load i8*, i8** %data, align 8, !dbg !104
  call void %0(i8* %1), !dbg !103
  ret void, !dbg !105
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink(i8* %data) #0 !dbg !106 {
entry:
  %data.addr = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !107, metadata !DIExpression()), !dbg !108
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !109, metadata !DIExpression()), !dbg !111
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !112
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !112
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !113
  store i8 0, i8* %arrayidx, align 1, !dbg !114
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !115
  %0 = load i8*, i8** %data.addr, align 8, !dbg !116
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !117
  %call = call i64 @strlen(i8* %arraydecay2) #7, !dbg !118
  %mul = mul i64 %call, 1, !dbg !119
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %arraydecay1, i8* align 1 %0, i64 %mul, i1 false), !dbg !115
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !120
  store i8 0, i8* %arrayidx3, align 1, !dbg !121
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !122
  call void @printLine(i8* %arraydecay4), !dbg !123
  ret void, !dbg !124
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { argmemonly nofree nounwind willreturn }
attributes #7 = { nounwind readonly willreturn }
attributes #8 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__char_declare_memmove_44.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_declare_memmove_44_bad", scope: !12, file: !12, line: 37, type: !13, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__char_declare_memmove_44.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 39, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!18 = !DILocation(line: 39, column: 12, scope: !11)
!19 = !DILocalVariable(name: "funcPtr", scope: !11, file: !12, line: 41, type: !20)
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !21, size: 64)
!21 = !DISubroutineType(types: !22)
!22 = !{null, !16}
!23 = !DILocation(line: 41, column: 12, scope: !11)
!24 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 42, type: !25)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 400, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 50)
!28 = !DILocation(line: 42, column: 10, scope: !11)
!29 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 43, type: !30)
!30 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 800, elements: !31)
!31 = !{!32}
!32 = !DISubrange(count: 100)
!33 = !DILocation(line: 43, column: 10, scope: !11)
!34 = !DILocation(line: 44, column: 5, scope: !11)
!35 = !DILocation(line: 45, column: 5, scope: !11)
!36 = !DILocation(line: 45, column: 25, scope: !11)
!37 = !DILocation(line: 46, column: 5, scope: !11)
!38 = !DILocation(line: 47, column: 5, scope: !11)
!39 = !DILocation(line: 47, column: 27, scope: !11)
!40 = !DILocation(line: 49, column: 12, scope: !11)
!41 = !DILocation(line: 49, column: 10, scope: !11)
!42 = !DILocation(line: 51, column: 5, scope: !11)
!43 = !DILocation(line: 51, column: 13, scope: !11)
!44 = !DILocation(line: 52, column: 1, scope: !11)
!45 = distinct !DISubprogram(name: "badSink", scope: !12, file: !12, line: 23, type: !21, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!46 = !DILocalVariable(name: "data", arg: 1, scope: !45, file: !12, line: 23, type: !16)
!47 = !DILocation(line: 23, column: 28, scope: !45)
!48 = !DILocalVariable(name: "dest", scope: !49, file: !12, line: 26, type: !30)
!49 = distinct !DILexicalBlock(scope: !45, file: !12, line: 25, column: 5)
!50 = !DILocation(line: 26, column: 14, scope: !49)
!51 = !DILocation(line: 27, column: 9, scope: !49)
!52 = !DILocation(line: 28, column: 9, scope: !49)
!53 = !DILocation(line: 28, column: 21, scope: !49)
!54 = !DILocation(line: 31, column: 9, scope: !49)
!55 = !DILocation(line: 31, column: 23, scope: !49)
!56 = !DILocation(line: 31, column: 36, scope: !49)
!57 = !DILocation(line: 31, column: 29, scope: !49)
!58 = !DILocation(line: 31, column: 41, scope: !49)
!59 = !DILocation(line: 32, column: 9, scope: !49)
!60 = !DILocation(line: 32, column: 21, scope: !49)
!61 = !DILocation(line: 33, column: 19, scope: !49)
!62 = !DILocation(line: 33, column: 9, scope: !49)
!63 = !DILocation(line: 35, column: 1, scope: !45)
!64 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_declare_memmove_44_good", scope: !12, file: !12, line: 88, type: !13, scopeLine: 89, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!65 = !DILocation(line: 90, column: 5, scope: !64)
!66 = !DILocation(line: 91, column: 1, scope: !64)
!67 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 102, type: !68, scopeLine: 103, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!68 = !DISubroutineType(types: !69)
!69 = !{!70, !70, !71}
!70 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!71 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!72 = !DILocalVariable(name: "argc", arg: 1, scope: !67, file: !12, line: 102, type: !70)
!73 = !DILocation(line: 102, column: 14, scope: !67)
!74 = !DILocalVariable(name: "argv", arg: 2, scope: !67, file: !12, line: 102, type: !71)
!75 = !DILocation(line: 102, column: 27, scope: !67)
!76 = !DILocation(line: 105, column: 22, scope: !67)
!77 = !DILocation(line: 105, column: 12, scope: !67)
!78 = !DILocation(line: 105, column: 5, scope: !67)
!79 = !DILocation(line: 107, column: 5, scope: !67)
!80 = !DILocation(line: 108, column: 5, scope: !67)
!81 = !DILocation(line: 109, column: 5, scope: !67)
!82 = !DILocation(line: 112, column: 5, scope: !67)
!83 = !DILocation(line: 113, column: 5, scope: !67)
!84 = !DILocation(line: 114, column: 5, scope: !67)
!85 = !DILocation(line: 116, column: 5, scope: !67)
!86 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 73, type: !13, scopeLine: 74, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!87 = !DILocalVariable(name: "data", scope: !86, file: !12, line: 75, type: !16)
!88 = !DILocation(line: 75, column: 12, scope: !86)
!89 = !DILocalVariable(name: "funcPtr", scope: !86, file: !12, line: 76, type: !20)
!90 = !DILocation(line: 76, column: 12, scope: !86)
!91 = !DILocalVariable(name: "dataBadBuffer", scope: !86, file: !12, line: 77, type: !25)
!92 = !DILocation(line: 77, column: 10, scope: !86)
!93 = !DILocalVariable(name: "dataGoodBuffer", scope: !86, file: !12, line: 78, type: !30)
!94 = !DILocation(line: 78, column: 10, scope: !86)
!95 = !DILocation(line: 79, column: 5, scope: !86)
!96 = !DILocation(line: 80, column: 5, scope: !86)
!97 = !DILocation(line: 80, column: 25, scope: !86)
!98 = !DILocation(line: 81, column: 5, scope: !86)
!99 = !DILocation(line: 82, column: 5, scope: !86)
!100 = !DILocation(line: 82, column: 27, scope: !86)
!101 = !DILocation(line: 84, column: 12, scope: !86)
!102 = !DILocation(line: 84, column: 10, scope: !86)
!103 = !DILocation(line: 85, column: 5, scope: !86)
!104 = !DILocation(line: 85, column: 13, scope: !86)
!105 = !DILocation(line: 86, column: 1, scope: !86)
!106 = distinct !DISubprogram(name: "goodG2BSink", scope: !12, file: !12, line: 59, type: !21, scopeLine: 60, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!107 = !DILocalVariable(name: "data", arg: 1, scope: !106, file: !12, line: 59, type: !16)
!108 = !DILocation(line: 59, column: 32, scope: !106)
!109 = !DILocalVariable(name: "dest", scope: !110, file: !12, line: 62, type: !30)
!110 = distinct !DILexicalBlock(scope: !106, file: !12, line: 61, column: 5)
!111 = !DILocation(line: 62, column: 14, scope: !110)
!112 = !DILocation(line: 63, column: 9, scope: !110)
!113 = !DILocation(line: 64, column: 9, scope: !110)
!114 = !DILocation(line: 64, column: 21, scope: !110)
!115 = !DILocation(line: 67, column: 9, scope: !110)
!116 = !DILocation(line: 67, column: 23, scope: !110)
!117 = !DILocation(line: 67, column: 36, scope: !110)
!118 = !DILocation(line: 67, column: 29, scope: !110)
!119 = !DILocation(line: 67, column: 41, scope: !110)
!120 = !DILocation(line: 68, column: 9, scope: !110)
!121 = !DILocation(line: 68, column: 21, scope: !110)
!122 = !DILocation(line: 69, column: 19, scope: !110)
!123 = !DILocation(line: 69, column: 9, scope: !110)
!124 = !DILocation(line: 71, column: 1, scope: !106)
