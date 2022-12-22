; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncpy_42.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncpy_42.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncpy_42_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !15, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !19, metadata !DIExpression()), !dbg !23
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !24
  store i8* %arraydecay, i8** %data, align 8, !dbg !25
  %0 = load i8*, i8** %data, align 8, !dbg !26
  %call = call i8* @badSource(i8* %0), !dbg !27
  store i8* %call, i8** %data, align 8, !dbg !28
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !29, metadata !DIExpression()), !dbg !34
  %1 = bitcast [50 x i8]* %dest to i8*, !dbg !34
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 50, i1 false), !dbg !34
  %arraydecay1 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !35
  %2 = load i8*, i8** %data, align 8, !dbg !36
  %3 = load i8*, i8** %data, align 8, !dbg !37
  %call2 = call i64 @strlen(i8* %3) #6, !dbg !38
  %call3 = call i8* @strncpy(i8* %arraydecay1, i8* %2, i64 %call2) #7, !dbg !39
  %arrayidx = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !40
  store i8 0, i8* %arrayidx, align 1, !dbg !41
  %4 = load i8*, i8** %data, align 8, !dbg !42
  call void @printLine(i8* %4), !dbg !43
  ret void, !dbg !44
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal i8* @badSource(i8* %data) #0 !dbg !45 {
entry:
  %data.addr = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !48, metadata !DIExpression()), !dbg !49
  %0 = load i8*, i8** %data.addr, align 8, !dbg !50
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 65, i64 99, i1 false), !dbg !51
  %1 = load i8*, i8** %data.addr, align 8, !dbg !52
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 99, !dbg !52
  store i8 0, i8* %arrayidx, align 1, !dbg !53
  %2 = load i8*, i8** %data.addr, align 8, !dbg !54
  ret i8* %2, !dbg !55
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i8* @strncpy(i8*, i8*, i64) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #4

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncpy_42_good() #0 !dbg !56 {
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
  %call = call i64 @time(i64* null) #7, !dbg !68
  %conv = trunc i64 %call to i32, !dbg !69
  call void @srand(i32 %conv) #7, !dbg !70
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !71
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncpy_42_good(), !dbg !72
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !73
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !74
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncpy_42_bad(), !dbg !75
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !76
  ret i32 0, !dbg !77
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !78 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !79, metadata !DIExpression()), !dbg !80
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !81, metadata !DIExpression()), !dbg !82
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !83
  store i8* %arraydecay, i8** %data, align 8, !dbg !84
  %0 = load i8*, i8** %data, align 8, !dbg !85
  %call = call i8* @goodG2BSource(i8* %0), !dbg !86
  store i8* %call, i8** %data, align 8, !dbg !87
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !88, metadata !DIExpression()), !dbg !90
  %1 = bitcast [50 x i8]* %dest to i8*, !dbg !90
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 50, i1 false), !dbg !90
  %arraydecay1 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !91
  %2 = load i8*, i8** %data, align 8, !dbg !92
  %3 = load i8*, i8** %data, align 8, !dbg !93
  %call2 = call i64 @strlen(i8* %3) #6, !dbg !94
  %call3 = call i8* @strncpy(i8* %arraydecay1, i8* %2, i64 %call2) #7, !dbg !95
  %arrayidx = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !96
  store i8 0, i8* %arrayidx, align 1, !dbg !97
  %4 = load i8*, i8** %data, align 8, !dbg !98
  call void @printLine(i8* %4), !dbg !99
  ret void, !dbg !100
}

; Function Attrs: noinline nounwind uwtable
define internal i8* @goodG2BSource(i8* %data) #0 !dbg !101 {
entry:
  %data.addr = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !102, metadata !DIExpression()), !dbg !103
  %0 = load i8*, i8** %data.addr, align 8, !dbg !104
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 65, i64 49, i1 false), !dbg !105
  %1 = load i8*, i8** %data.addr, align 8, !dbg !106
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 49, !dbg !106
  store i8 0, i8* %arrayidx, align 1, !dbg !107
  %2 = load i8*, i8** %data.addr, align 8, !dbg !108
  ret i8* %2, !dbg !109
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncpy_42.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncpy_42_bad", scope: !12, file: !12, line: 31, type: !13, scopeLine: 32, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncpy_42.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 33, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!18 = !DILocation(line: 33, column: 12, scope: !11)
!19 = !DILocalVariable(name: "dataBuffer", scope: !11, file: !12, line: 34, type: !20)
!20 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 800, elements: !21)
!21 = !{!22}
!22 = !DISubrange(count: 100)
!23 = !DILocation(line: 34, column: 10, scope: !11)
!24 = !DILocation(line: 35, column: 12, scope: !11)
!25 = !DILocation(line: 35, column: 10, scope: !11)
!26 = !DILocation(line: 36, column: 22, scope: !11)
!27 = !DILocation(line: 36, column: 12, scope: !11)
!28 = !DILocation(line: 36, column: 10, scope: !11)
!29 = !DILocalVariable(name: "dest", scope: !30, file: !12, line: 38, type: !31)
!30 = distinct !DILexicalBlock(scope: !11, file: !12, line: 37, column: 5)
!31 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 400, elements: !32)
!32 = !{!33}
!33 = !DISubrange(count: 50)
!34 = !DILocation(line: 38, column: 14, scope: !30)
!35 = !DILocation(line: 40, column: 17, scope: !30)
!36 = !DILocation(line: 40, column: 23, scope: !30)
!37 = !DILocation(line: 40, column: 36, scope: !30)
!38 = !DILocation(line: 40, column: 29, scope: !30)
!39 = !DILocation(line: 40, column: 9, scope: !30)
!40 = !DILocation(line: 41, column: 9, scope: !30)
!41 = !DILocation(line: 41, column: 20, scope: !30)
!42 = !DILocation(line: 42, column: 19, scope: !30)
!43 = !DILocation(line: 42, column: 9, scope: !30)
!44 = !DILocation(line: 44, column: 1, scope: !11)
!45 = distinct !DISubprogram(name: "badSource", scope: !12, file: !12, line: 23, type: !46, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!46 = !DISubroutineType(types: !47)
!47 = !{!16, !16}
!48 = !DILocalVariable(name: "data", arg: 1, scope: !45, file: !12, line: 23, type: !16)
!49 = !DILocation(line: 23, column: 32, scope: !45)
!50 = !DILocation(line: 26, column: 12, scope: !45)
!51 = !DILocation(line: 26, column: 5, scope: !45)
!52 = !DILocation(line: 27, column: 5, scope: !45)
!53 = !DILocation(line: 27, column: 17, scope: !45)
!54 = !DILocation(line: 28, column: 12, scope: !45)
!55 = !DILocation(line: 28, column: 5, scope: !45)
!56 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncpy_42_good", scope: !12, file: !12, line: 74, type: !13, scopeLine: 75, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!57 = !DILocation(line: 76, column: 5, scope: !56)
!58 = !DILocation(line: 77, column: 1, scope: !56)
!59 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 89, type: !60, scopeLine: 90, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!60 = !DISubroutineType(types: !61)
!61 = !{!62, !62, !63}
!62 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!63 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!64 = !DILocalVariable(name: "argc", arg: 1, scope: !59, file: !12, line: 89, type: !62)
!65 = !DILocation(line: 89, column: 14, scope: !59)
!66 = !DILocalVariable(name: "argv", arg: 2, scope: !59, file: !12, line: 89, type: !63)
!67 = !DILocation(line: 89, column: 27, scope: !59)
!68 = !DILocation(line: 92, column: 22, scope: !59)
!69 = !DILocation(line: 92, column: 12, scope: !59)
!70 = !DILocation(line: 92, column: 5, scope: !59)
!71 = !DILocation(line: 94, column: 5, scope: !59)
!72 = !DILocation(line: 95, column: 5, scope: !59)
!73 = !DILocation(line: 96, column: 5, scope: !59)
!74 = !DILocation(line: 99, column: 5, scope: !59)
!75 = !DILocation(line: 100, column: 5, scope: !59)
!76 = !DILocation(line: 101, column: 5, scope: !59)
!77 = !DILocation(line: 103, column: 5, scope: !59)
!78 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 59, type: !13, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!79 = !DILocalVariable(name: "data", scope: !78, file: !12, line: 61, type: !16)
!80 = !DILocation(line: 61, column: 12, scope: !78)
!81 = !DILocalVariable(name: "dataBuffer", scope: !78, file: !12, line: 62, type: !20)
!82 = !DILocation(line: 62, column: 10, scope: !78)
!83 = !DILocation(line: 63, column: 12, scope: !78)
!84 = !DILocation(line: 63, column: 10, scope: !78)
!85 = !DILocation(line: 64, column: 26, scope: !78)
!86 = !DILocation(line: 64, column: 12, scope: !78)
!87 = !DILocation(line: 64, column: 10, scope: !78)
!88 = !DILocalVariable(name: "dest", scope: !89, file: !12, line: 66, type: !31)
!89 = distinct !DILexicalBlock(scope: !78, file: !12, line: 65, column: 5)
!90 = !DILocation(line: 66, column: 14, scope: !89)
!91 = !DILocation(line: 68, column: 17, scope: !89)
!92 = !DILocation(line: 68, column: 23, scope: !89)
!93 = !DILocation(line: 68, column: 36, scope: !89)
!94 = !DILocation(line: 68, column: 29, scope: !89)
!95 = !DILocation(line: 68, column: 9, scope: !89)
!96 = !DILocation(line: 69, column: 9, scope: !89)
!97 = !DILocation(line: 69, column: 20, scope: !89)
!98 = !DILocation(line: 70, column: 19, scope: !89)
!99 = !DILocation(line: 70, column: 9, scope: !89)
!100 = !DILocation(line: 72, column: 1, scope: !78)
!101 = distinct !DISubprogram(name: "goodG2BSource", scope: !12, file: !12, line: 50, type: !46, scopeLine: 51, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!102 = !DILocalVariable(name: "data", arg: 1, scope: !101, file: !12, line: 50, type: !16)
!103 = !DILocation(line: 50, column: 36, scope: !101)
!104 = !DILocation(line: 53, column: 12, scope: !101)
!105 = !DILocation(line: 53, column: 5, scope: !101)
!106 = !DILocation(line: 54, column: 5, scope: !101)
!107 = !DILocation(line: 54, column: 16, scope: !101)
!108 = !DILocation(line: 55, column: 12, scope: !101)
!109 = !DILocation(line: 55, column: 5, scope: !101)
