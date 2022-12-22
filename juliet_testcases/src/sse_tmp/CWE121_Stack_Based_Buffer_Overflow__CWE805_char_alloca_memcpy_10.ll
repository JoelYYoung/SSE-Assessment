; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_memcpy_10.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_memcpy_10.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@globalTrue = external dso_local global i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@globalFalse = external dso_local global i32, align 4
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_memcpy_10_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !19, metadata !DIExpression()), !dbg !20
  %0 = alloca i8, i64 50, align 16, !dbg !21
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !20
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !22, metadata !DIExpression()), !dbg !23
  %1 = alloca i8, i64 100, align 16, !dbg !24
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !23
  %2 = load i32, i32* @globalTrue, align 4, !dbg !25
  %tobool = icmp ne i32 %2, 0, !dbg !25
  br i1 %tobool, label %if.then, label %if.end, !dbg !27

if.then:                                          ; preds = %entry
  %3 = load i8*, i8** %dataBadBuffer, align 8, !dbg !28
  store i8* %3, i8** %data, align 8, !dbg !30
  %4 = load i8*, i8** %data, align 8, !dbg !31
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 0, !dbg !31
  store i8 0, i8* %arrayidx, align 1, !dbg !32
  br label %if.end, !dbg !33

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !34, metadata !DIExpression()), !dbg !39
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !40
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !40
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !41
  store i8 0, i8* %arrayidx1, align 1, !dbg !42
  %5 = load i8*, i8** %data, align 8, !dbg !43
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !44
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %5, i8* align 16 %arraydecay2, i64 100, i1 false), !dbg !44
  %6 = load i8*, i8** %data, align 8, !dbg !45
  %arrayidx3 = getelementptr inbounds i8, i8* %6, i64 99, !dbg !45
  store i8 0, i8* %arrayidx3, align 1, !dbg !46
  %7 = load i8*, i8** %data, align 8, !dbg !47
  call void @printLine(i8* %7), !dbg !48
  ret void, !dbg !49
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_memcpy_10_good() #0 !dbg !50 {
entry:
  call void @goodG2B1(), !dbg !51
  call void @goodG2B2(), !dbg !52
  ret void, !dbg !53
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !54 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !59, metadata !DIExpression()), !dbg !60
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !61, metadata !DIExpression()), !dbg !62
  %call = call i64 @time(i64* null) #6, !dbg !63
  %conv = trunc i64 %call to i32, !dbg !64
  call void @srand(i32 %conv) #6, !dbg !65
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !66
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_memcpy_10_good(), !dbg !67
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !68
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !69
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_memcpy_10_bad(), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !71
  ret i32 0, !dbg !72
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !73 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !74, metadata !DIExpression()), !dbg !75
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !76, metadata !DIExpression()), !dbg !77
  %0 = alloca i8, i64 50, align 16, !dbg !78
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !77
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !79, metadata !DIExpression()), !dbg !80
  %1 = alloca i8, i64 100, align 16, !dbg !81
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !80
  %2 = load i32, i32* @globalFalse, align 4, !dbg !82
  %tobool = icmp ne i32 %2, 0, !dbg !82
  br i1 %tobool, label %if.then, label %if.else, !dbg !84

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !85
  br label %if.end, !dbg !87

if.else:                                          ; preds = %entry
  %3 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !88
  store i8* %3, i8** %data, align 8, !dbg !90
  %4 = load i8*, i8** %data, align 8, !dbg !91
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 0, !dbg !91
  store i8 0, i8* %arrayidx, align 1, !dbg !92
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !93, metadata !DIExpression()), !dbg !95
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !96
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !96
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !97
  store i8 0, i8* %arrayidx1, align 1, !dbg !98
  %5 = load i8*, i8** %data, align 8, !dbg !99
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !100
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %5, i8* align 16 %arraydecay2, i64 100, i1 false), !dbg !100
  %6 = load i8*, i8** %data, align 8, !dbg !101
  %arrayidx3 = getelementptr inbounds i8, i8* %6, i64 99, !dbg !101
  store i8 0, i8* %arrayidx3, align 1, !dbg !102
  %7 = load i8*, i8** %data, align 8, !dbg !103
  call void @printLine(i8* %7), !dbg !104
  ret void, !dbg !105
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !106 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !107, metadata !DIExpression()), !dbg !108
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !109, metadata !DIExpression()), !dbg !110
  %0 = alloca i8, i64 50, align 16, !dbg !111
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !110
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !112, metadata !DIExpression()), !dbg !113
  %1 = alloca i8, i64 100, align 16, !dbg !114
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !113
  %2 = load i32, i32* @globalTrue, align 4, !dbg !115
  %tobool = icmp ne i32 %2, 0, !dbg !115
  br i1 %tobool, label %if.then, label %if.end, !dbg !117

if.then:                                          ; preds = %entry
  %3 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !118
  store i8* %3, i8** %data, align 8, !dbg !120
  %4 = load i8*, i8** %data, align 8, !dbg !121
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 0, !dbg !121
  store i8 0, i8* %arrayidx, align 1, !dbg !122
  br label %if.end, !dbg !123

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !124, metadata !DIExpression()), !dbg !126
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !127
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !127
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !128
  store i8 0, i8* %arrayidx1, align 1, !dbg !129
  %5 = load i8*, i8** %data, align 8, !dbg !130
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !131
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %5, i8* align 16 %arraydecay2, i64 100, i1 false), !dbg !131
  %6 = load i8*, i8** %data, align 8, !dbg !132
  %arrayidx3 = getelementptr inbounds i8, i8* %6, i64 99, !dbg !132
  store i8 0, i8* %arrayidx3, align 1, !dbg !133
  %7 = load i8*, i8** %data, align 8, !dbg !134
  call void @printLine(i8* %7), !dbg !135
  ret void, !dbg !136
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { argmemonly nofree nounwind willreturn }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_memcpy_10.c", directory: "/root/SSE-Assessment")
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
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_memcpy_10_bad", scope: !14, file: !14, line: 23, type: !15, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_memcpy_10.c", directory: "/root/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 25, type: !4)
!18 = !DILocation(line: 25, column: 12, scope: !13)
!19 = !DILocalVariable(name: "dataBadBuffer", scope: !13, file: !14, line: 26, type: !4)
!20 = !DILocation(line: 26, column: 12, scope: !13)
!21 = !DILocation(line: 26, column: 36, scope: !13)
!22 = !DILocalVariable(name: "dataGoodBuffer", scope: !13, file: !14, line: 27, type: !4)
!23 = !DILocation(line: 27, column: 12, scope: !13)
!24 = !DILocation(line: 27, column: 37, scope: !13)
!25 = !DILocation(line: 28, column: 8, scope: !26)
!26 = distinct !DILexicalBlock(scope: !13, file: !14, line: 28, column: 8)
!27 = !DILocation(line: 28, column: 8, scope: !13)
!28 = !DILocation(line: 32, column: 16, scope: !29)
!29 = distinct !DILexicalBlock(scope: !26, file: !14, line: 29, column: 5)
!30 = !DILocation(line: 32, column: 14, scope: !29)
!31 = !DILocation(line: 33, column: 9, scope: !29)
!32 = !DILocation(line: 33, column: 17, scope: !29)
!33 = !DILocation(line: 34, column: 5, scope: !29)
!34 = !DILocalVariable(name: "source", scope: !35, file: !14, line: 36, type: !36)
!35 = distinct !DILexicalBlock(scope: !13, file: !14, line: 35, column: 5)
!36 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !37)
!37 = !{!38}
!38 = !DISubrange(count: 100)
!39 = !DILocation(line: 36, column: 14, scope: !35)
!40 = !DILocation(line: 37, column: 9, scope: !35)
!41 = !DILocation(line: 38, column: 9, scope: !35)
!42 = !DILocation(line: 38, column: 23, scope: !35)
!43 = !DILocation(line: 40, column: 16, scope: !35)
!44 = !DILocation(line: 40, column: 9, scope: !35)
!45 = !DILocation(line: 41, column: 9, scope: !35)
!46 = !DILocation(line: 41, column: 21, scope: !35)
!47 = !DILocation(line: 42, column: 19, scope: !35)
!48 = !DILocation(line: 42, column: 9, scope: !35)
!49 = !DILocation(line: 44, column: 1, scope: !13)
!50 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_memcpy_10_good", scope: !14, file: !14, line: 101, type: !15, scopeLine: 102, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!51 = !DILocation(line: 103, column: 5, scope: !50)
!52 = !DILocation(line: 104, column: 5, scope: !50)
!53 = !DILocation(line: 105, column: 1, scope: !50)
!54 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 117, type: !55, scopeLine: 118, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!55 = !DISubroutineType(types: !56)
!56 = !{!57, !57, !58}
!57 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!58 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!59 = !DILocalVariable(name: "argc", arg: 1, scope: !54, file: !14, line: 117, type: !57)
!60 = !DILocation(line: 117, column: 14, scope: !54)
!61 = !DILocalVariable(name: "argv", arg: 2, scope: !54, file: !14, line: 117, type: !58)
!62 = !DILocation(line: 117, column: 27, scope: !54)
!63 = !DILocation(line: 120, column: 22, scope: !54)
!64 = !DILocation(line: 120, column: 12, scope: !54)
!65 = !DILocation(line: 120, column: 5, scope: !54)
!66 = !DILocation(line: 122, column: 5, scope: !54)
!67 = !DILocation(line: 123, column: 5, scope: !54)
!68 = !DILocation(line: 124, column: 5, scope: !54)
!69 = !DILocation(line: 127, column: 5, scope: !54)
!70 = !DILocation(line: 128, column: 5, scope: !54)
!71 = !DILocation(line: 129, column: 5, scope: !54)
!72 = !DILocation(line: 131, column: 5, scope: !54)
!73 = distinct !DISubprogram(name: "goodG2B1", scope: !14, file: !14, line: 51, type: !15, scopeLine: 52, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!74 = !DILocalVariable(name: "data", scope: !73, file: !14, line: 53, type: !4)
!75 = !DILocation(line: 53, column: 12, scope: !73)
!76 = !DILocalVariable(name: "dataBadBuffer", scope: !73, file: !14, line: 54, type: !4)
!77 = !DILocation(line: 54, column: 12, scope: !73)
!78 = !DILocation(line: 54, column: 36, scope: !73)
!79 = !DILocalVariable(name: "dataGoodBuffer", scope: !73, file: !14, line: 55, type: !4)
!80 = !DILocation(line: 55, column: 12, scope: !73)
!81 = !DILocation(line: 55, column: 37, scope: !73)
!82 = !DILocation(line: 56, column: 8, scope: !83)
!83 = distinct !DILexicalBlock(scope: !73, file: !14, line: 56, column: 8)
!84 = !DILocation(line: 56, column: 8, scope: !73)
!85 = !DILocation(line: 59, column: 9, scope: !86)
!86 = distinct !DILexicalBlock(scope: !83, file: !14, line: 57, column: 5)
!87 = !DILocation(line: 60, column: 5, scope: !86)
!88 = !DILocation(line: 64, column: 16, scope: !89)
!89 = distinct !DILexicalBlock(scope: !83, file: !14, line: 62, column: 5)
!90 = !DILocation(line: 64, column: 14, scope: !89)
!91 = !DILocation(line: 65, column: 9, scope: !89)
!92 = !DILocation(line: 65, column: 17, scope: !89)
!93 = !DILocalVariable(name: "source", scope: !94, file: !14, line: 68, type: !36)
!94 = distinct !DILexicalBlock(scope: !73, file: !14, line: 67, column: 5)
!95 = !DILocation(line: 68, column: 14, scope: !94)
!96 = !DILocation(line: 69, column: 9, scope: !94)
!97 = !DILocation(line: 70, column: 9, scope: !94)
!98 = !DILocation(line: 70, column: 23, scope: !94)
!99 = !DILocation(line: 72, column: 16, scope: !94)
!100 = !DILocation(line: 72, column: 9, scope: !94)
!101 = !DILocation(line: 73, column: 9, scope: !94)
!102 = !DILocation(line: 73, column: 21, scope: !94)
!103 = !DILocation(line: 74, column: 19, scope: !94)
!104 = !DILocation(line: 74, column: 9, scope: !94)
!105 = !DILocation(line: 76, column: 1, scope: !73)
!106 = distinct !DISubprogram(name: "goodG2B2", scope: !14, file: !14, line: 79, type: !15, scopeLine: 80, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!107 = !DILocalVariable(name: "data", scope: !106, file: !14, line: 81, type: !4)
!108 = !DILocation(line: 81, column: 12, scope: !106)
!109 = !DILocalVariable(name: "dataBadBuffer", scope: !106, file: !14, line: 82, type: !4)
!110 = !DILocation(line: 82, column: 12, scope: !106)
!111 = !DILocation(line: 82, column: 36, scope: !106)
!112 = !DILocalVariable(name: "dataGoodBuffer", scope: !106, file: !14, line: 83, type: !4)
!113 = !DILocation(line: 83, column: 12, scope: !106)
!114 = !DILocation(line: 83, column: 37, scope: !106)
!115 = !DILocation(line: 84, column: 8, scope: !116)
!116 = distinct !DILexicalBlock(scope: !106, file: !14, line: 84, column: 8)
!117 = !DILocation(line: 84, column: 8, scope: !106)
!118 = !DILocation(line: 87, column: 16, scope: !119)
!119 = distinct !DILexicalBlock(scope: !116, file: !14, line: 85, column: 5)
!120 = !DILocation(line: 87, column: 14, scope: !119)
!121 = !DILocation(line: 88, column: 9, scope: !119)
!122 = !DILocation(line: 88, column: 17, scope: !119)
!123 = !DILocation(line: 89, column: 5, scope: !119)
!124 = !DILocalVariable(name: "source", scope: !125, file: !14, line: 91, type: !36)
!125 = distinct !DILexicalBlock(scope: !106, file: !14, line: 90, column: 5)
!126 = !DILocation(line: 91, column: 14, scope: !125)
!127 = !DILocation(line: 92, column: 9, scope: !125)
!128 = !DILocation(line: 93, column: 9, scope: !125)
!129 = !DILocation(line: 93, column: 23, scope: !125)
!130 = !DILocation(line: 95, column: 16, scope: !125)
!131 = !DILocation(line: 95, column: 9, scope: !125)
!132 = !DILocation(line: 96, column: 9, scope: !125)
!133 = !DILocation(line: 96, column: 21, scope: !125)
!134 = !DILocation(line: 97, column: 19, scope: !125)
!135 = !DILocation(line: 97, column: 9, scope: !125)
!136 = !DILocation(line: 99, column: 1, scope: !106)
