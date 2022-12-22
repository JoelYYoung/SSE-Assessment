; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_42.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_42.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_42_bad() #0 !dbg !11 {
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
  %call2 = call i64 @strlen(i8* %2) #6, !dbg !37
  %3 = load i8*, i8** %data, align 8, !dbg !38
  %call3 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* %arraydecay1, i64 %call2, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i8* %3) #7, !dbg !39
  %4 = load i8*, i8** %data, align 8, !dbg !40
  call void @printLine(i8* %4), !dbg !41
  ret void, !dbg !42
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal i8* @badSource(i8* %data) #0 !dbg !43 {
entry:
  %data.addr = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !46, metadata !DIExpression()), !dbg !47
  %0 = load i8*, i8** %data.addr, align 8, !dbg !48
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 65, i64 99, i1 false), !dbg !49
  %1 = load i8*, i8** %data.addr, align 8, !dbg !50
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 99, !dbg !50
  store i8 0, i8* %arrayidx, align 1, !dbg !51
  %2 = load i8*, i8** %data.addr, align 8, !dbg !52
  ret i8* %2, !dbg !53
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i32 @snprintf(i8*, i64, i8*, ...) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #4

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_42_good() #0 !dbg !54 {
entry:
  call void @goodG2B(), !dbg !55
  ret void, !dbg !56
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !57 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !62, metadata !DIExpression()), !dbg !63
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !64, metadata !DIExpression()), !dbg !65
  %call = call i64 @time(i64* null) #7, !dbg !66
  %conv = trunc i64 %call to i32, !dbg !67
  call void @srand(i32 %conv) #7, !dbg !68
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !69
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_42_good(), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !71
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !72
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_42_bad(), !dbg !73
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !74
  ret i32 0, !dbg !75
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !76 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !77, metadata !DIExpression()), !dbg !78
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !79, metadata !DIExpression()), !dbg !80
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !81
  store i8* %arraydecay, i8** %data, align 8, !dbg !82
  %0 = load i8*, i8** %data, align 8, !dbg !83
  %call = call i8* @goodG2BSource(i8* %0), !dbg !84
  store i8* %call, i8** %data, align 8, !dbg !85
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !86, metadata !DIExpression()), !dbg !88
  %1 = bitcast [50 x i8]* %dest to i8*, !dbg !88
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 50, i1 false), !dbg !88
  %arraydecay1 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !89
  %2 = load i8*, i8** %data, align 8, !dbg !90
  %call2 = call i64 @strlen(i8* %2) #6, !dbg !91
  %3 = load i8*, i8** %data, align 8, !dbg !92
  %call3 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* %arraydecay1, i64 %call2, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i8* %3) #7, !dbg !93
  %4 = load i8*, i8** %data, align 8, !dbg !94
  call void @printLine(i8* %4), !dbg !95
  ret void, !dbg !96
}

; Function Attrs: noinline nounwind uwtable
define internal i8* @goodG2BSource(i8* %data) #0 !dbg !97 {
entry:
  %data.addr = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !98, metadata !DIExpression()), !dbg !99
  %0 = load i8*, i8** %data.addr, align 8, !dbg !100
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 65, i64 49, i1 false), !dbg !101
  %1 = load i8*, i8** %data.addr, align 8, !dbg !102
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 49, !dbg !102
  store i8 0, i8* %arrayidx, align 1, !dbg !103
  %2 = load i8*, i8** %data.addr, align 8, !dbg !104
  ret i8* %2, !dbg !105
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_42.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_42_bad", scope: !12, file: !12, line: 37, type: !13, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_42.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 39, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!18 = !DILocation(line: 39, column: 12, scope: !11)
!19 = !DILocalVariable(name: "dataBuffer", scope: !11, file: !12, line: 40, type: !20)
!20 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 800, elements: !21)
!21 = !{!22}
!22 = !DISubrange(count: 100)
!23 = !DILocation(line: 40, column: 10, scope: !11)
!24 = !DILocation(line: 41, column: 12, scope: !11)
!25 = !DILocation(line: 41, column: 10, scope: !11)
!26 = !DILocation(line: 42, column: 22, scope: !11)
!27 = !DILocation(line: 42, column: 12, scope: !11)
!28 = !DILocation(line: 42, column: 10, scope: !11)
!29 = !DILocalVariable(name: "dest", scope: !30, file: !12, line: 44, type: !31)
!30 = distinct !DILexicalBlock(scope: !11, file: !12, line: 43, column: 5)
!31 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 400, elements: !32)
!32 = !{!33}
!33 = !DISubrange(count: 50)
!34 = !DILocation(line: 44, column: 14, scope: !30)
!35 = !DILocation(line: 46, column: 18, scope: !30)
!36 = !DILocation(line: 46, column: 31, scope: !30)
!37 = !DILocation(line: 46, column: 24, scope: !30)
!38 = !DILocation(line: 46, column: 44, scope: !30)
!39 = !DILocation(line: 46, column: 9, scope: !30)
!40 = !DILocation(line: 47, column: 19, scope: !30)
!41 = !DILocation(line: 47, column: 9, scope: !30)
!42 = !DILocation(line: 49, column: 1, scope: !11)
!43 = distinct !DISubprogram(name: "badSource", scope: !12, file: !12, line: 29, type: !44, scopeLine: 30, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!44 = !DISubroutineType(types: !45)
!45 = !{!16, !16}
!46 = !DILocalVariable(name: "data", arg: 1, scope: !43, file: !12, line: 29, type: !16)
!47 = !DILocation(line: 29, column: 32, scope: !43)
!48 = !DILocation(line: 32, column: 12, scope: !43)
!49 = !DILocation(line: 32, column: 5, scope: !43)
!50 = !DILocation(line: 33, column: 5, scope: !43)
!51 = !DILocation(line: 33, column: 17, scope: !43)
!52 = !DILocation(line: 34, column: 12, scope: !43)
!53 = !DILocation(line: 34, column: 5, scope: !43)
!54 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_42_good", scope: !12, file: !12, line: 78, type: !13, scopeLine: 79, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!55 = !DILocation(line: 80, column: 5, scope: !54)
!56 = !DILocation(line: 81, column: 1, scope: !54)
!57 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 93, type: !58, scopeLine: 94, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!58 = !DISubroutineType(types: !59)
!59 = !{!60, !60, !61}
!60 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!61 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!62 = !DILocalVariable(name: "argc", arg: 1, scope: !57, file: !12, line: 93, type: !60)
!63 = !DILocation(line: 93, column: 14, scope: !57)
!64 = !DILocalVariable(name: "argv", arg: 2, scope: !57, file: !12, line: 93, type: !61)
!65 = !DILocation(line: 93, column: 27, scope: !57)
!66 = !DILocation(line: 96, column: 22, scope: !57)
!67 = !DILocation(line: 96, column: 12, scope: !57)
!68 = !DILocation(line: 96, column: 5, scope: !57)
!69 = !DILocation(line: 98, column: 5, scope: !57)
!70 = !DILocation(line: 99, column: 5, scope: !57)
!71 = !DILocation(line: 100, column: 5, scope: !57)
!72 = !DILocation(line: 103, column: 5, scope: !57)
!73 = !DILocation(line: 104, column: 5, scope: !57)
!74 = !DILocation(line: 105, column: 5, scope: !57)
!75 = !DILocation(line: 107, column: 5, scope: !57)
!76 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 64, type: !13, scopeLine: 65, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!77 = !DILocalVariable(name: "data", scope: !76, file: !12, line: 66, type: !16)
!78 = !DILocation(line: 66, column: 12, scope: !76)
!79 = !DILocalVariable(name: "dataBuffer", scope: !76, file: !12, line: 67, type: !20)
!80 = !DILocation(line: 67, column: 10, scope: !76)
!81 = !DILocation(line: 68, column: 12, scope: !76)
!82 = !DILocation(line: 68, column: 10, scope: !76)
!83 = !DILocation(line: 69, column: 26, scope: !76)
!84 = !DILocation(line: 69, column: 12, scope: !76)
!85 = !DILocation(line: 69, column: 10, scope: !76)
!86 = !DILocalVariable(name: "dest", scope: !87, file: !12, line: 71, type: !31)
!87 = distinct !DILexicalBlock(scope: !76, file: !12, line: 70, column: 5)
!88 = !DILocation(line: 71, column: 14, scope: !87)
!89 = !DILocation(line: 73, column: 18, scope: !87)
!90 = !DILocation(line: 73, column: 31, scope: !87)
!91 = !DILocation(line: 73, column: 24, scope: !87)
!92 = !DILocation(line: 73, column: 44, scope: !87)
!93 = !DILocation(line: 73, column: 9, scope: !87)
!94 = !DILocation(line: 74, column: 19, scope: !87)
!95 = !DILocation(line: 74, column: 9, scope: !87)
!96 = !DILocation(line: 76, column: 1, scope: !76)
!97 = distinct !DISubprogram(name: "goodG2BSource", scope: !12, file: !12, line: 55, type: !44, scopeLine: 56, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!98 = !DILocalVariable(name: "data", arg: 1, scope: !97, file: !12, line: 55, type: !16)
!99 = !DILocation(line: 55, column: 36, scope: !97)
!100 = !DILocation(line: 58, column: 12, scope: !97)
!101 = !DILocation(line: 58, column: 5, scope: !97)
!102 = !DILocation(line: 59, column: 5, scope: !97)
!103 = !DILocation(line: 59, column: 16, scope: !97)
!104 = !DILocation(line: 60, column: 12, scope: !97)
!105 = !DILocation(line: 60, column: 5, scope: !97)
