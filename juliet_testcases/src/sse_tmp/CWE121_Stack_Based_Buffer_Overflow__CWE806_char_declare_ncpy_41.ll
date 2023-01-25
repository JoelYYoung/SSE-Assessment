; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncpy_41.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncpy_41.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncpy_41_badSink(i8* %data) #0 !dbg !11 {
entry:
  %data.addr = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !19, metadata !DIExpression()), !dbg !24
  %0 = bitcast [50 x i8]* %dest to i8*, !dbg !24
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 50, i1 false), !dbg !24
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !25
  %1 = load i8*, i8** %data.addr, align 8, !dbg !26
  %2 = load i8*, i8** %data.addr, align 8, !dbg !27
  %call = call i64 @strlen(i8* %2) #6, !dbg !28
  %call1 = call i8* @strncpy(i8* %arraydecay, i8* %1, i64 %call) #7, !dbg !29
  %arrayidx = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !30
  store i8 0, i8* %arrayidx, align 1, !dbg !31
  %3 = load i8*, i8** %data.addr, align 8, !dbg !32
  call void @printLine(i8* %3), !dbg !33
  ret void, !dbg !34
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i8* @strncpy(i8*, i8*, i64) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #4

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncpy_41_bad() #0 !dbg !35 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !38, metadata !DIExpression()), !dbg !39
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !40, metadata !DIExpression()), !dbg !44
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !45
  store i8* %arraydecay, i8** %data, align 8, !dbg !46
  %0 = load i8*, i8** %data, align 8, !dbg !47
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 65, i64 99, i1 false), !dbg !48
  %1 = load i8*, i8** %data, align 8, !dbg !49
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 99, !dbg !49
  store i8 0, i8* %arrayidx, align 1, !dbg !50
  %2 = load i8*, i8** %data, align 8, !dbg !51
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncpy_41_badSink(i8* %2), !dbg !52
  ret void, !dbg !53
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncpy_41_goodG2BSink(i8* %data) #0 !dbg !54 {
entry:
  %data.addr = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !55, metadata !DIExpression()), !dbg !56
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !57, metadata !DIExpression()), !dbg !59
  %0 = bitcast [50 x i8]* %dest to i8*, !dbg !59
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 50, i1 false), !dbg !59
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !60
  %1 = load i8*, i8** %data.addr, align 8, !dbg !61
  %2 = load i8*, i8** %data.addr, align 8, !dbg !62
  %call = call i64 @strlen(i8* %2) #6, !dbg !63
  %call1 = call i8* @strncpy(i8* %arraydecay, i8* %1, i64 %call) #7, !dbg !64
  %arrayidx = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !65
  store i8 0, i8* %arrayidx, align 1, !dbg !66
  %3 = load i8*, i8** %data.addr, align 8, !dbg !67
  call void @printLine(i8* %3), !dbg !68
  ret void, !dbg !69
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncpy_41_good() #0 !dbg !70 {
entry:
  call void @goodG2B(), !dbg !71
  ret void, !dbg !72
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !73 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !78, metadata !DIExpression()), !dbg !79
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !80, metadata !DIExpression()), !dbg !81
  %call = call i64 @time(i64* null) #7, !dbg !82
  %conv = trunc i64 %call to i32, !dbg !83
  call void @srand(i32 %conv) #7, !dbg !84
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !85
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncpy_41_good(), !dbg !86
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !87
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !88
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncpy_41_bad(), !dbg !89
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !90
  ret i32 0, !dbg !91
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !92 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !93, metadata !DIExpression()), !dbg !94
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !95, metadata !DIExpression()), !dbg !96
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !97
  store i8* %arraydecay, i8** %data, align 8, !dbg !98
  %0 = load i8*, i8** %data, align 8, !dbg !99
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 65, i64 49, i1 false), !dbg !100
  %1 = load i8*, i8** %data, align 8, !dbg !101
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 49, !dbg !101
  store i8 0, i8* %arrayidx, align 1, !dbg !102
  %2 = load i8*, i8** %data, align 8, !dbg !103
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncpy_41_goodG2BSink(i8* %2), !dbg !104
  ret void, !dbg !105
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncpy_41.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncpy_41_badSink", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncpy_41.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null, !15}
!15 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!16 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!17 = !DILocalVariable(name: "data", arg: 1, scope: !11, file: !12, line: 23, type: !15)
!18 = !DILocation(line: 23, column: 85, scope: !11)
!19 = !DILocalVariable(name: "dest", scope: !20, file: !12, line: 26, type: !21)
!20 = distinct !DILexicalBlock(scope: !11, file: !12, line: 25, column: 5)
!21 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 400, elements: !22)
!22 = !{!23}
!23 = !DISubrange(count: 50)
!24 = !DILocation(line: 26, column: 14, scope: !20)
!25 = !DILocation(line: 28, column: 17, scope: !20)
!26 = !DILocation(line: 28, column: 23, scope: !20)
!27 = !DILocation(line: 28, column: 36, scope: !20)
!28 = !DILocation(line: 28, column: 29, scope: !20)
!29 = !DILocation(line: 28, column: 9, scope: !20)
!30 = !DILocation(line: 29, column: 9, scope: !20)
!31 = !DILocation(line: 29, column: 20, scope: !20)
!32 = !DILocation(line: 30, column: 19, scope: !20)
!33 = !DILocation(line: 30, column: 9, scope: !20)
!34 = !DILocation(line: 32, column: 1, scope: !11)
!35 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncpy_41_bad", scope: !12, file: !12, line: 34, type: !36, scopeLine: 35, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!36 = !DISubroutineType(types: !37)
!37 = !{null}
!38 = !DILocalVariable(name: "data", scope: !35, file: !12, line: 36, type: !15)
!39 = !DILocation(line: 36, column: 12, scope: !35)
!40 = !DILocalVariable(name: "dataBuffer", scope: !35, file: !12, line: 37, type: !41)
!41 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 800, elements: !42)
!42 = !{!43}
!43 = !DISubrange(count: 100)
!44 = !DILocation(line: 37, column: 10, scope: !35)
!45 = !DILocation(line: 38, column: 12, scope: !35)
!46 = !DILocation(line: 38, column: 10, scope: !35)
!47 = !DILocation(line: 40, column: 12, scope: !35)
!48 = !DILocation(line: 40, column: 5, scope: !35)
!49 = !DILocation(line: 41, column: 5, scope: !35)
!50 = !DILocation(line: 41, column: 17, scope: !35)
!51 = !DILocation(line: 42, column: 77, scope: !35)
!52 = !DILocation(line: 42, column: 5, scope: !35)
!53 = !DILocation(line: 43, column: 1, scope: !35)
!54 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncpy_41_goodG2BSink", scope: !12, file: !12, line: 49, type: !13, scopeLine: 50, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!55 = !DILocalVariable(name: "data", arg: 1, scope: !54, file: !12, line: 49, type: !15)
!56 = !DILocation(line: 49, column: 89, scope: !54)
!57 = !DILocalVariable(name: "dest", scope: !58, file: !12, line: 52, type: !21)
!58 = distinct !DILexicalBlock(scope: !54, file: !12, line: 51, column: 5)
!59 = !DILocation(line: 52, column: 14, scope: !58)
!60 = !DILocation(line: 54, column: 17, scope: !58)
!61 = !DILocation(line: 54, column: 23, scope: !58)
!62 = !DILocation(line: 54, column: 36, scope: !58)
!63 = !DILocation(line: 54, column: 29, scope: !58)
!64 = !DILocation(line: 54, column: 9, scope: !58)
!65 = !DILocation(line: 55, column: 9, scope: !58)
!66 = !DILocation(line: 55, column: 20, scope: !58)
!67 = !DILocation(line: 56, column: 19, scope: !58)
!68 = !DILocation(line: 56, column: 9, scope: !58)
!69 = !DILocation(line: 58, column: 1, scope: !54)
!70 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncpy_41_good", scope: !12, file: !12, line: 72, type: !36, scopeLine: 73, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!71 = !DILocation(line: 74, column: 5, scope: !70)
!72 = !DILocation(line: 75, column: 1, scope: !70)
!73 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 87, type: !74, scopeLine: 88, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!74 = !DISubroutineType(types: !75)
!75 = !{!76, !76, !77}
!76 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!77 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64)
!78 = !DILocalVariable(name: "argc", arg: 1, scope: !73, file: !12, line: 87, type: !76)
!79 = !DILocation(line: 87, column: 14, scope: !73)
!80 = !DILocalVariable(name: "argv", arg: 2, scope: !73, file: !12, line: 87, type: !77)
!81 = !DILocation(line: 87, column: 27, scope: !73)
!82 = !DILocation(line: 90, column: 22, scope: !73)
!83 = !DILocation(line: 90, column: 12, scope: !73)
!84 = !DILocation(line: 90, column: 5, scope: !73)
!85 = !DILocation(line: 92, column: 5, scope: !73)
!86 = !DILocation(line: 93, column: 5, scope: !73)
!87 = !DILocation(line: 94, column: 5, scope: !73)
!88 = !DILocation(line: 97, column: 5, scope: !73)
!89 = !DILocation(line: 98, column: 5, scope: !73)
!90 = !DILocation(line: 99, column: 5, scope: !73)
!91 = !DILocation(line: 101, column: 5, scope: !73)
!92 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 61, type: !36, scopeLine: 62, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!93 = !DILocalVariable(name: "data", scope: !92, file: !12, line: 63, type: !15)
!94 = !DILocation(line: 63, column: 12, scope: !92)
!95 = !DILocalVariable(name: "dataBuffer", scope: !92, file: !12, line: 64, type: !41)
!96 = !DILocation(line: 64, column: 10, scope: !92)
!97 = !DILocation(line: 65, column: 12, scope: !92)
!98 = !DILocation(line: 65, column: 10, scope: !92)
!99 = !DILocation(line: 67, column: 12, scope: !92)
!100 = !DILocation(line: 67, column: 5, scope: !92)
!101 = !DILocation(line: 68, column: 5, scope: !92)
!102 = !DILocation(line: 68, column: 16, scope: !92)
!103 = !DILocation(line: 69, column: 81, scope: !92)
!104 = !DILocation(line: 69, column: 5, scope: !92)
!105 = !DILocation(line: 70, column: 1, scope: !92)
