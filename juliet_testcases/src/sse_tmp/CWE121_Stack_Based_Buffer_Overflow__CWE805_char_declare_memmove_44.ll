; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_memmove_44.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_memmove_44.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_memmove_44_bad() #0 !dbg !11 {
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
  store i8* %arraydecay, i8** %data, align 8, !dbg !35
  %0 = load i8*, i8** %data, align 8, !dbg !36
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 0, !dbg !36
  store i8 0, i8* %arrayidx, align 1, !dbg !37
  %1 = load void (i8*)*, void (i8*)** %funcPtr, align 8, !dbg !38
  %2 = load i8*, i8** %data, align 8, !dbg !39
  call void %1(i8* %2), !dbg !38
  ret void, !dbg !40
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal void @badSink(i8* %data) #0 !dbg !41 {
entry:
  %data.addr = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !42, metadata !DIExpression()), !dbg !43
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !44, metadata !DIExpression()), !dbg !46
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !47
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !47
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !48
  store i8 0, i8* %arrayidx, align 1, !dbg !49
  %0 = load i8*, i8** %data.addr, align 8, !dbg !50
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !51
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 1 %0, i8* align 16 %arraydecay1, i64 100, i1 false), !dbg !51
  %1 = load i8*, i8** %data.addr, align 8, !dbg !52
  %arrayidx2 = getelementptr inbounds i8, i8* %1, i64 99, !dbg !52
  store i8 0, i8* %arrayidx2, align 1, !dbg !53
  %2 = load i8*, i8** %data.addr, align 8, !dbg !54
  call void @printLine(i8* %2), !dbg !55
  ret void, !dbg !56
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_memmove_44_good() #0 !dbg !57 {
entry:
  call void @goodG2B(), !dbg !58
  ret void, !dbg !59
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !60 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !65, metadata !DIExpression()), !dbg !66
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !67, metadata !DIExpression()), !dbg !68
  %call = call i64 @time(i64* null) #6, !dbg !69
  %conv = trunc i64 %call to i32, !dbg !70
  call void @srand(i32 %conv) #6, !dbg !71
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !72
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_memmove_44_good(), !dbg !73
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !74
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !75
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_memmove_44_bad(), !dbg !76
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !77
  ret i32 0, !dbg !78
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !79 {
entry:
  %data = alloca i8*, align 8
  %funcPtr = alloca void (i8*)*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !80, metadata !DIExpression()), !dbg !81
  call void @llvm.dbg.declare(metadata void (i8*)** %funcPtr, metadata !82, metadata !DIExpression()), !dbg !83
  store void (i8*)* @goodG2BSink, void (i8*)** %funcPtr, align 8, !dbg !83
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !84, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !86, metadata !DIExpression()), !dbg !87
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !88
  store i8* %arraydecay, i8** %data, align 8, !dbg !89
  %0 = load i8*, i8** %data, align 8, !dbg !90
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 0, !dbg !90
  store i8 0, i8* %arrayidx, align 1, !dbg !91
  %1 = load void (i8*)*, void (i8*)** %funcPtr, align 8, !dbg !92
  %2 = load i8*, i8** %data, align 8, !dbg !93
  call void %1(i8* %2), !dbg !92
  ret void, !dbg !94
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink(i8* %data) #0 !dbg !95 {
entry:
  %data.addr = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !96, metadata !DIExpression()), !dbg !97
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !98, metadata !DIExpression()), !dbg !100
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !101
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !101
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !102
  store i8 0, i8* %arrayidx, align 1, !dbg !103
  %0 = load i8*, i8** %data.addr, align 8, !dbg !104
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !105
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 1 %0, i8* align 16 %arraydecay1, i64 100, i1 false), !dbg !105
  %1 = load i8*, i8** %data.addr, align 8, !dbg !106
  %arrayidx2 = getelementptr inbounds i8, i8* %1, i64 99, !dbg !106
  store i8 0, i8* %arrayidx2, align 1, !dbg !107
  %2 = load i8*, i8** %data.addr, align 8, !dbg !108
  call void @printLine(i8* %2), !dbg !109
  ret void, !dbg !110
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { argmemonly nofree nounwind willreturn }
attributes #6 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_memmove_44.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_memmove_44_bad", scope: !12, file: !12, line: 36, type: !13, scopeLine: 37, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_memmove_44.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 38, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!18 = !DILocation(line: 38, column: 12, scope: !11)
!19 = !DILocalVariable(name: "funcPtr", scope: !11, file: !12, line: 40, type: !20)
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !21, size: 64)
!21 = !DISubroutineType(types: !22)
!22 = !{null, !16}
!23 = !DILocation(line: 40, column: 12, scope: !11)
!24 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 41, type: !25)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 400, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 50)
!28 = !DILocation(line: 41, column: 10, scope: !11)
!29 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 42, type: !30)
!30 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 800, elements: !31)
!31 = !{!32}
!32 = !DISubrange(count: 100)
!33 = !DILocation(line: 42, column: 10, scope: !11)
!34 = !DILocation(line: 45, column: 12, scope: !11)
!35 = !DILocation(line: 45, column: 10, scope: !11)
!36 = !DILocation(line: 46, column: 5, scope: !11)
!37 = !DILocation(line: 46, column: 13, scope: !11)
!38 = !DILocation(line: 48, column: 5, scope: !11)
!39 = !DILocation(line: 48, column: 13, scope: !11)
!40 = !DILocation(line: 49, column: 1, scope: !11)
!41 = distinct !DISubprogram(name: "badSink", scope: !12, file: !12, line: 23, type: !21, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!42 = !DILocalVariable(name: "data", arg: 1, scope: !41, file: !12, line: 23, type: !16)
!43 = !DILocation(line: 23, column: 28, scope: !41)
!44 = !DILocalVariable(name: "source", scope: !45, file: !12, line: 26, type: !30)
!45 = distinct !DILexicalBlock(scope: !41, file: !12, line: 25, column: 5)
!46 = !DILocation(line: 26, column: 14, scope: !45)
!47 = !DILocation(line: 27, column: 9, scope: !45)
!48 = !DILocation(line: 28, column: 9, scope: !45)
!49 = !DILocation(line: 28, column: 23, scope: !45)
!50 = !DILocation(line: 30, column: 17, scope: !45)
!51 = !DILocation(line: 30, column: 9, scope: !45)
!52 = !DILocation(line: 31, column: 9, scope: !45)
!53 = !DILocation(line: 31, column: 21, scope: !45)
!54 = !DILocation(line: 32, column: 19, scope: !45)
!55 = !DILocation(line: 32, column: 9, scope: !45)
!56 = !DILocation(line: 34, column: 1, scope: !41)
!57 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_memmove_44_good", scope: !12, file: !12, line: 81, type: !13, scopeLine: 82, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!58 = !DILocation(line: 83, column: 5, scope: !57)
!59 = !DILocation(line: 84, column: 1, scope: !57)
!60 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 95, type: !61, scopeLine: 96, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!61 = !DISubroutineType(types: !62)
!62 = !{!63, !63, !64}
!63 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!64 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!65 = !DILocalVariable(name: "argc", arg: 1, scope: !60, file: !12, line: 95, type: !63)
!66 = !DILocation(line: 95, column: 14, scope: !60)
!67 = !DILocalVariable(name: "argv", arg: 2, scope: !60, file: !12, line: 95, type: !64)
!68 = !DILocation(line: 95, column: 27, scope: !60)
!69 = !DILocation(line: 98, column: 22, scope: !60)
!70 = !DILocation(line: 98, column: 12, scope: !60)
!71 = !DILocation(line: 98, column: 5, scope: !60)
!72 = !DILocation(line: 100, column: 5, scope: !60)
!73 = !DILocation(line: 101, column: 5, scope: !60)
!74 = !DILocation(line: 102, column: 5, scope: !60)
!75 = !DILocation(line: 105, column: 5, scope: !60)
!76 = !DILocation(line: 106, column: 5, scope: !60)
!77 = !DILocation(line: 107, column: 5, scope: !60)
!78 = !DILocation(line: 109, column: 5, scope: !60)
!79 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 69, type: !13, scopeLine: 70, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!80 = !DILocalVariable(name: "data", scope: !79, file: !12, line: 71, type: !16)
!81 = !DILocation(line: 71, column: 12, scope: !79)
!82 = !DILocalVariable(name: "funcPtr", scope: !79, file: !12, line: 72, type: !20)
!83 = !DILocation(line: 72, column: 12, scope: !79)
!84 = !DILocalVariable(name: "dataBadBuffer", scope: !79, file: !12, line: 73, type: !25)
!85 = !DILocation(line: 73, column: 10, scope: !79)
!86 = !DILocalVariable(name: "dataGoodBuffer", scope: !79, file: !12, line: 74, type: !30)
!87 = !DILocation(line: 74, column: 10, scope: !79)
!88 = !DILocation(line: 76, column: 12, scope: !79)
!89 = !DILocation(line: 76, column: 10, scope: !79)
!90 = !DILocation(line: 77, column: 5, scope: !79)
!91 = !DILocation(line: 77, column: 13, scope: !79)
!92 = !DILocation(line: 78, column: 5, scope: !79)
!93 = !DILocation(line: 78, column: 13, scope: !79)
!94 = !DILocation(line: 79, column: 1, scope: !79)
!95 = distinct !DISubprogram(name: "goodG2BSink", scope: !12, file: !12, line: 56, type: !21, scopeLine: 57, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!96 = !DILocalVariable(name: "data", arg: 1, scope: !95, file: !12, line: 56, type: !16)
!97 = !DILocation(line: 56, column: 32, scope: !95)
!98 = !DILocalVariable(name: "source", scope: !99, file: !12, line: 59, type: !30)
!99 = distinct !DILexicalBlock(scope: !95, file: !12, line: 58, column: 5)
!100 = !DILocation(line: 59, column: 14, scope: !99)
!101 = !DILocation(line: 60, column: 9, scope: !99)
!102 = !DILocation(line: 61, column: 9, scope: !99)
!103 = !DILocation(line: 61, column: 23, scope: !99)
!104 = !DILocation(line: 63, column: 17, scope: !99)
!105 = !DILocation(line: 63, column: 9, scope: !99)
!106 = !DILocation(line: 64, column: 9, scope: !99)
!107 = !DILocation(line: 64, column: 21, scope: !99)
!108 = !DILocation(line: 65, column: 19, scope: !99)
!109 = !DILocation(line: 65, column: 9, scope: !99)
!110 = !DILocation(line: 67, column: 1, scope: !95)
