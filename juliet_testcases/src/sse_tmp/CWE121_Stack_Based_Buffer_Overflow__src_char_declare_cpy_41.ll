; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cpy_41.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cpy_41.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cpy_41_badSink(i8* %data) #0 !dbg !11 {
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
  %call = call i8* @strcpy(i8* %arraydecay, i8* %1) #5, !dbg !27
  %2 = load i8*, i8** %data.addr, align 8, !dbg !28
  call void @printLine(i8* %2), !dbg !29
  ret void, !dbg !30
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cpy_41_bad() #0 !dbg !31 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !34, metadata !DIExpression()), !dbg !35
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !36, metadata !DIExpression()), !dbg !40
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !41
  store i8* %arraydecay, i8** %data, align 8, !dbg !42
  %0 = load i8*, i8** %data, align 8, !dbg !43
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 65, i64 99, i1 false), !dbg !44
  %1 = load i8*, i8** %data, align 8, !dbg !45
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 99, !dbg !45
  store i8 0, i8* %arrayidx, align 1, !dbg !46
  %2 = load i8*, i8** %data, align 8, !dbg !47
  call void @CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cpy_41_badSink(i8* %2), !dbg !48
  ret void, !dbg !49
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cpy_41_goodG2BSink(i8* %data) #0 !dbg !50 {
entry:
  %data.addr = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !51, metadata !DIExpression()), !dbg !52
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !53, metadata !DIExpression()), !dbg !55
  %0 = bitcast [50 x i8]* %dest to i8*, !dbg !55
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 50, i1 false), !dbg !55
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !56
  %1 = load i8*, i8** %data.addr, align 8, !dbg !57
  %call = call i8* @strcpy(i8* %arraydecay, i8* %1) #5, !dbg !58
  %2 = load i8*, i8** %data.addr, align 8, !dbg !59
  call void @printLine(i8* %2), !dbg !60
  ret void, !dbg !61
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cpy_41_good() #0 !dbg !62 {
entry:
  call void @goodG2B(), !dbg !63
  ret void, !dbg !64
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !65 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !70, metadata !DIExpression()), !dbg !71
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !72, metadata !DIExpression()), !dbg !73
  %call = call i64 @time(i64* null) #5, !dbg !74
  %conv = trunc i64 %call to i32, !dbg !75
  call void @srand(i32 %conv) #5, !dbg !76
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !77
  call void @CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cpy_41_good(), !dbg !78
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !79
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !80
  call void @CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cpy_41_bad(), !dbg !81
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !82
  ret i32 0, !dbg !83
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !84 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !85, metadata !DIExpression()), !dbg !86
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !87, metadata !DIExpression()), !dbg !88
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !89
  store i8* %arraydecay, i8** %data, align 8, !dbg !90
  %0 = load i8*, i8** %data, align 8, !dbg !91
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 65, i64 49, i1 false), !dbg !92
  %1 = load i8*, i8** %data, align 8, !dbg !93
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 49, !dbg !93
  store i8 0, i8* %arrayidx, align 1, !dbg !94
  %2 = load i8*, i8** %data, align 8, !dbg !95
  call void @CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cpy_41_goodG2BSink(i8* %2), !dbg !96
  ret void, !dbg !97
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cpy_41.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cpy_41_badSink", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cpy_41.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null, !15}
!15 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!16 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!17 = !DILocalVariable(name: "data", arg: 1, scope: !11, file: !12, line: 23, type: !15)
!18 = !DILocation(line: 23, column: 81, scope: !11)
!19 = !DILocalVariable(name: "dest", scope: !20, file: !12, line: 26, type: !21)
!20 = distinct !DILexicalBlock(scope: !11, file: !12, line: 25, column: 5)
!21 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 400, elements: !22)
!22 = !{!23}
!23 = !DISubrange(count: 50)
!24 = !DILocation(line: 26, column: 14, scope: !20)
!25 = !DILocation(line: 28, column: 16, scope: !20)
!26 = !DILocation(line: 28, column: 22, scope: !20)
!27 = !DILocation(line: 28, column: 9, scope: !20)
!28 = !DILocation(line: 29, column: 19, scope: !20)
!29 = !DILocation(line: 29, column: 9, scope: !20)
!30 = !DILocation(line: 31, column: 1, scope: !11)
!31 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cpy_41_bad", scope: !12, file: !12, line: 33, type: !32, scopeLine: 34, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!32 = !DISubroutineType(types: !33)
!33 = !{null}
!34 = !DILocalVariable(name: "data", scope: !31, file: !12, line: 35, type: !15)
!35 = !DILocation(line: 35, column: 12, scope: !31)
!36 = !DILocalVariable(name: "dataBuffer", scope: !31, file: !12, line: 36, type: !37)
!37 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 800, elements: !38)
!38 = !{!39}
!39 = !DISubrange(count: 100)
!40 = !DILocation(line: 36, column: 10, scope: !31)
!41 = !DILocation(line: 37, column: 12, scope: !31)
!42 = !DILocation(line: 37, column: 10, scope: !31)
!43 = !DILocation(line: 39, column: 12, scope: !31)
!44 = !DILocation(line: 39, column: 5, scope: !31)
!45 = !DILocation(line: 40, column: 5, scope: !31)
!46 = !DILocation(line: 40, column: 17, scope: !31)
!47 = !DILocation(line: 41, column: 73, scope: !31)
!48 = !DILocation(line: 41, column: 5, scope: !31)
!49 = !DILocation(line: 42, column: 1, scope: !31)
!50 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cpy_41_goodG2BSink", scope: !12, file: !12, line: 48, type: !13, scopeLine: 49, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!51 = !DILocalVariable(name: "data", arg: 1, scope: !50, file: !12, line: 48, type: !15)
!52 = !DILocation(line: 48, column: 85, scope: !50)
!53 = !DILocalVariable(name: "dest", scope: !54, file: !12, line: 51, type: !21)
!54 = distinct !DILexicalBlock(scope: !50, file: !12, line: 50, column: 5)
!55 = !DILocation(line: 51, column: 14, scope: !54)
!56 = !DILocation(line: 53, column: 16, scope: !54)
!57 = !DILocation(line: 53, column: 22, scope: !54)
!58 = !DILocation(line: 53, column: 9, scope: !54)
!59 = !DILocation(line: 54, column: 19, scope: !54)
!60 = !DILocation(line: 54, column: 9, scope: !54)
!61 = !DILocation(line: 56, column: 1, scope: !50)
!62 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cpy_41_good", scope: !12, file: !12, line: 70, type: !32, scopeLine: 71, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!63 = !DILocation(line: 72, column: 5, scope: !62)
!64 = !DILocation(line: 73, column: 1, scope: !62)
!65 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 85, type: !66, scopeLine: 86, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!66 = !DISubroutineType(types: !67)
!67 = !{!68, !68, !69}
!68 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!69 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64)
!70 = !DILocalVariable(name: "argc", arg: 1, scope: !65, file: !12, line: 85, type: !68)
!71 = !DILocation(line: 85, column: 14, scope: !65)
!72 = !DILocalVariable(name: "argv", arg: 2, scope: !65, file: !12, line: 85, type: !69)
!73 = !DILocation(line: 85, column: 27, scope: !65)
!74 = !DILocation(line: 88, column: 22, scope: !65)
!75 = !DILocation(line: 88, column: 12, scope: !65)
!76 = !DILocation(line: 88, column: 5, scope: !65)
!77 = !DILocation(line: 90, column: 5, scope: !65)
!78 = !DILocation(line: 91, column: 5, scope: !65)
!79 = !DILocation(line: 92, column: 5, scope: !65)
!80 = !DILocation(line: 95, column: 5, scope: !65)
!81 = !DILocation(line: 96, column: 5, scope: !65)
!82 = !DILocation(line: 97, column: 5, scope: !65)
!83 = !DILocation(line: 99, column: 5, scope: !65)
!84 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 59, type: !32, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!85 = !DILocalVariable(name: "data", scope: !84, file: !12, line: 61, type: !15)
!86 = !DILocation(line: 61, column: 12, scope: !84)
!87 = !DILocalVariable(name: "dataBuffer", scope: !84, file: !12, line: 62, type: !37)
!88 = !DILocation(line: 62, column: 10, scope: !84)
!89 = !DILocation(line: 63, column: 12, scope: !84)
!90 = !DILocation(line: 63, column: 10, scope: !84)
!91 = !DILocation(line: 65, column: 12, scope: !84)
!92 = !DILocation(line: 65, column: 5, scope: !84)
!93 = !DILocation(line: 66, column: 5, scope: !84)
!94 = !DILocation(line: 66, column: 16, scope: !84)
!95 = !DILocation(line: 67, column: 77, scope: !84)
!96 = !DILocation(line: 67, column: 5, scope: !84)
!97 = !DILocation(line: 68, column: 1, scope: !84)
