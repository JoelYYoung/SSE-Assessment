; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cpy_12.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cpy_12.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cpy_12_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !19, metadata !DIExpression()), !dbg !20
  %0 = alloca i8, i64 100, align 16, !dbg !21
  store i8* %0, i8** %dataBuffer, align 8, !dbg !20
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !22
  store i8* %1, i8** %data, align 8, !dbg !23
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !24
  %tobool = icmp ne i32 %call, 0, !dbg !24
  br i1 %tobool, label %if.then, label %if.else, !dbg !26

if.then:                                          ; preds = %entry
  %2 = load i8*, i8** %data, align 8, !dbg !27
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 99, i1 false), !dbg !29
  %3 = load i8*, i8** %data, align 8, !dbg !30
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 99, !dbg !30
  store i8 0, i8* %arrayidx, align 1, !dbg !31
  br label %if.end, !dbg !32

if.else:                                          ; preds = %entry
  %4 = load i8*, i8** %data, align 8, !dbg !33
  call void @llvm.memset.p0i8.i64(i8* align 1 %4, i8 65, i64 49, i1 false), !dbg !35
  %5 = load i8*, i8** %data, align 8, !dbg !36
  %arrayidx1 = getelementptr inbounds i8, i8* %5, i64 49, !dbg !36
  store i8 0, i8* %arrayidx1, align 1, !dbg !37
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !38, metadata !DIExpression()), !dbg !43
  %6 = bitcast [50 x i8]* %dest to i8*, !dbg !43
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 50, i1 false), !dbg !43
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !44
  %7 = load i8*, i8** %data, align 8, !dbg !45
  %call2 = call i8* @strcpy(i8* %arraydecay, i8* %7) #5, !dbg !46
  %8 = load i8*, i8** %data, align 8, !dbg !47
  call void @printLine(i8* %8), !dbg !48
  ret void, !dbg !49
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @globalReturnsTrueOrFalse(...) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #4

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cpy_12_good() #0 !dbg !50 {
entry:
  call void @goodG2B(), !dbg !51
  ret void, !dbg !52
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !53 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !58, metadata !DIExpression()), !dbg !59
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !60, metadata !DIExpression()), !dbg !61
  %call = call i64 @time(i64* null) #5, !dbg !62
  %conv = trunc i64 %call to i32, !dbg !63
  call void @srand(i32 %conv) #5, !dbg !64
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !65
  call void @CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cpy_12_good(), !dbg !66
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !67
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !68
  call void @CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cpy_12_bad(), !dbg !69
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !70
  ret i32 0, !dbg !71
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !72 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !73, metadata !DIExpression()), !dbg !74
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !75, metadata !DIExpression()), !dbg !76
  %0 = alloca i8, i64 100, align 16, !dbg !77
  store i8* %0, i8** %dataBuffer, align 8, !dbg !76
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !78
  store i8* %1, i8** %data, align 8, !dbg !79
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !80
  %tobool = icmp ne i32 %call, 0, !dbg !80
  br i1 %tobool, label %if.then, label %if.else, !dbg !82

if.then:                                          ; preds = %entry
  %2 = load i8*, i8** %data, align 8, !dbg !83
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !85
  %3 = load i8*, i8** %data, align 8, !dbg !86
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !86
  store i8 0, i8* %arrayidx, align 1, !dbg !87
  br label %if.end, !dbg !88

if.else:                                          ; preds = %entry
  %4 = load i8*, i8** %data, align 8, !dbg !89
  call void @llvm.memset.p0i8.i64(i8* align 1 %4, i8 65, i64 49, i1 false), !dbg !91
  %5 = load i8*, i8** %data, align 8, !dbg !92
  %arrayidx1 = getelementptr inbounds i8, i8* %5, i64 49, !dbg !92
  store i8 0, i8* %arrayidx1, align 1, !dbg !93
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !94, metadata !DIExpression()), !dbg !96
  %6 = bitcast [50 x i8]* %dest to i8*, !dbg !96
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 50, i1 false), !dbg !96
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !97
  %7 = load i8*, i8** %data, align 8, !dbg !98
  %call2 = call i8* @strcpy(i8* %arraydecay, i8* %7) #5, !dbg !99
  %8 = load i8*, i8** %data, align 8, !dbg !100
  call void @printLine(i8* %8), !dbg !101
  ret void, !dbg !102
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cpy_12.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !6}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{i32 7, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{i32 1, !"wchar_size", i32 4}
!10 = !{i32 7, !"uwtable", i32 1}
!11 = !{i32 7, !"frame-pointer", i32 2}
!12 = !{!"clang version 13.0.0"}
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cpy_12_bad", scope: !14, file: !14, line: 23, type: !15, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cpy_12.c", directory: "/root/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 25, type: !4)
!18 = !DILocation(line: 25, column: 12, scope: !13)
!19 = !DILocalVariable(name: "dataBuffer", scope: !13, file: !14, line: 26, type: !4)
!20 = !DILocation(line: 26, column: 12, scope: !13)
!21 = !DILocation(line: 26, column: 33, scope: !13)
!22 = !DILocation(line: 27, column: 12, scope: !13)
!23 = !DILocation(line: 27, column: 10, scope: !13)
!24 = !DILocation(line: 28, column: 8, scope: !25)
!25 = distinct !DILexicalBlock(scope: !13, file: !14, line: 28, column: 8)
!26 = !DILocation(line: 28, column: 8, scope: !13)
!27 = !DILocation(line: 31, column: 16, scope: !28)
!28 = distinct !DILexicalBlock(scope: !25, file: !14, line: 29, column: 5)
!29 = !DILocation(line: 31, column: 9, scope: !28)
!30 = !DILocation(line: 32, column: 9, scope: !28)
!31 = !DILocation(line: 32, column: 21, scope: !28)
!32 = !DILocation(line: 33, column: 5, scope: !28)
!33 = !DILocation(line: 37, column: 16, scope: !34)
!34 = distinct !DILexicalBlock(scope: !25, file: !14, line: 35, column: 5)
!35 = !DILocation(line: 37, column: 9, scope: !34)
!36 = !DILocation(line: 38, column: 9, scope: !34)
!37 = !DILocation(line: 38, column: 20, scope: !34)
!38 = !DILocalVariable(name: "dest", scope: !39, file: !14, line: 41, type: !40)
!39 = distinct !DILexicalBlock(scope: !13, file: !14, line: 40, column: 5)
!40 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 400, elements: !41)
!41 = !{!42}
!42 = !DISubrange(count: 50)
!43 = !DILocation(line: 41, column: 14, scope: !39)
!44 = !DILocation(line: 43, column: 16, scope: !39)
!45 = !DILocation(line: 43, column: 22, scope: !39)
!46 = !DILocation(line: 43, column: 9, scope: !39)
!47 = !DILocation(line: 44, column: 19, scope: !39)
!48 = !DILocation(line: 44, column: 9, scope: !39)
!49 = !DILocation(line: 46, column: 1, scope: !13)
!50 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cpy_12_good", scope: !14, file: !14, line: 79, type: !15, scopeLine: 80, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!51 = !DILocation(line: 81, column: 5, scope: !50)
!52 = !DILocation(line: 82, column: 1, scope: !50)
!53 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 94, type: !54, scopeLine: 95, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!54 = !DISubroutineType(types: !55)
!55 = !{!56, !56, !57}
!56 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!57 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!58 = !DILocalVariable(name: "argc", arg: 1, scope: !53, file: !14, line: 94, type: !56)
!59 = !DILocation(line: 94, column: 14, scope: !53)
!60 = !DILocalVariable(name: "argv", arg: 2, scope: !53, file: !14, line: 94, type: !57)
!61 = !DILocation(line: 94, column: 27, scope: !53)
!62 = !DILocation(line: 97, column: 22, scope: !53)
!63 = !DILocation(line: 97, column: 12, scope: !53)
!64 = !DILocation(line: 97, column: 5, scope: !53)
!65 = !DILocation(line: 99, column: 5, scope: !53)
!66 = !DILocation(line: 100, column: 5, scope: !53)
!67 = !DILocation(line: 101, column: 5, scope: !53)
!68 = !DILocation(line: 104, column: 5, scope: !53)
!69 = !DILocation(line: 105, column: 5, scope: !53)
!70 = !DILocation(line: 106, column: 5, scope: !53)
!71 = !DILocation(line: 108, column: 5, scope: !53)
!72 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 54, type: !15, scopeLine: 55, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!73 = !DILocalVariable(name: "data", scope: !72, file: !14, line: 56, type: !4)
!74 = !DILocation(line: 56, column: 12, scope: !72)
!75 = !DILocalVariable(name: "dataBuffer", scope: !72, file: !14, line: 57, type: !4)
!76 = !DILocation(line: 57, column: 12, scope: !72)
!77 = !DILocation(line: 57, column: 33, scope: !72)
!78 = !DILocation(line: 58, column: 12, scope: !72)
!79 = !DILocation(line: 58, column: 10, scope: !72)
!80 = !DILocation(line: 59, column: 8, scope: !81)
!81 = distinct !DILexicalBlock(scope: !72, file: !14, line: 59, column: 8)
!82 = !DILocation(line: 59, column: 8, scope: !72)
!83 = !DILocation(line: 62, column: 16, scope: !84)
!84 = distinct !DILexicalBlock(scope: !81, file: !14, line: 60, column: 5)
!85 = !DILocation(line: 62, column: 9, scope: !84)
!86 = !DILocation(line: 63, column: 9, scope: !84)
!87 = !DILocation(line: 63, column: 20, scope: !84)
!88 = !DILocation(line: 64, column: 5, scope: !84)
!89 = !DILocation(line: 68, column: 16, scope: !90)
!90 = distinct !DILexicalBlock(scope: !81, file: !14, line: 66, column: 5)
!91 = !DILocation(line: 68, column: 9, scope: !90)
!92 = !DILocation(line: 69, column: 9, scope: !90)
!93 = !DILocation(line: 69, column: 20, scope: !90)
!94 = !DILocalVariable(name: "dest", scope: !95, file: !14, line: 72, type: !40)
!95 = distinct !DILexicalBlock(scope: !72, file: !14, line: 71, column: 5)
!96 = !DILocation(line: 72, column: 14, scope: !95)
!97 = !DILocation(line: 74, column: 16, scope: !95)
!98 = !DILocation(line: 74, column: 22, scope: !95)
!99 = !DILocation(line: 74, column: 9, scope: !95)
!100 = !DILocation(line: 75, column: 19, scope: !95)
!101 = !DILocation(line: 75, column: 9, scope: !95)
!102 = !DILocation(line: 77, column: 1, scope: !72)
