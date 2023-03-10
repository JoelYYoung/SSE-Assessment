; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__char_alloca_memcpy_08.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__char_alloca_memcpy_08.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__char_alloca_memcpy_08_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !19, metadata !DIExpression()), !dbg !20
  %0 = alloca i8, i64 100, align 16, !dbg !21
  store i8* %0, i8** %dataBuffer, align 8, !dbg !20
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !22
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !23
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !24
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !24
  store i8 0, i8* %arrayidx, align 1, !dbg !25
  %call = call i32 @staticReturnsTrue(), !dbg !26
  %tobool = icmp ne i32 %call, 0, !dbg !26
  br i1 %tobool, label %if.then, label %if.end, !dbg !28

if.then:                                          ; preds = %entry
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !29
  %add.ptr = getelementptr inbounds i8, i8* %3, i64 -8, !dbg !31
  store i8* %add.ptr, i8** %data, align 8, !dbg !32
  br label %if.end, !dbg !33

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !34, metadata !DIExpression()), !dbg !39
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !40
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !40
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !41
  store i8 0, i8* %arrayidx1, align 1, !dbg !42
  %4 = load i8*, i8** %data, align 8, !dbg !43
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !44
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %4, i8* align 16 %arraydecay2, i64 100, i1 false), !dbg !44
  %5 = load i8*, i8** %data, align 8, !dbg !45
  %arrayidx3 = getelementptr inbounds i8, i8* %5, i64 99, !dbg !45
  store i8 0, i8* %arrayidx3, align 1, !dbg !46
  %6 = load i8*, i8** %data, align 8, !dbg !47
  call void @printLine(i8* %6), !dbg !48
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
define dso_local void @CWE124_Buffer_Underwrite__char_alloca_memcpy_08_good() #0 !dbg !50 {
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
  call void @CWE124_Buffer_Underwrite__char_alloca_memcpy_08_good(), !dbg !67
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !68
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !69
  call void @CWE124_Buffer_Underwrite__char_alloca_memcpy_08_bad(), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !71
  ret i32 0, !dbg !72
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !73 {
entry:
  ret i32 1, !dbg !76
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !77 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !78, metadata !DIExpression()), !dbg !79
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !80, metadata !DIExpression()), !dbg !81
  %0 = alloca i8, i64 100, align 16, !dbg !82
  store i8* %0, i8** %dataBuffer, align 8, !dbg !81
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !83
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !84
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !85
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !85
  store i8 0, i8* %arrayidx, align 1, !dbg !86
  %call = call i32 @staticReturnsFalse(), !dbg !87
  %tobool = icmp ne i32 %call, 0, !dbg !87
  br i1 %tobool, label %if.then, label %if.else, !dbg !89

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !90
  br label %if.end, !dbg !92

if.else:                                          ; preds = %entry
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !93
  store i8* %3, i8** %data, align 8, !dbg !95
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !96, metadata !DIExpression()), !dbg !98
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !99
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !99
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !100
  store i8 0, i8* %arrayidx1, align 1, !dbg !101
  %4 = load i8*, i8** %data, align 8, !dbg !102
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !103
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %4, i8* align 16 %arraydecay2, i64 100, i1 false), !dbg !103
  %5 = load i8*, i8** %data, align 8, !dbg !104
  %arrayidx3 = getelementptr inbounds i8, i8* %5, i64 99, !dbg !104
  store i8 0, i8* %arrayidx3, align 1, !dbg !105
  %6 = load i8*, i8** %data, align 8, !dbg !106
  call void @printLine(i8* %6), !dbg !107
  ret void, !dbg !108
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !109 {
entry:
  ret i32 0, !dbg !110
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !111 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !112, metadata !DIExpression()), !dbg !113
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !114, metadata !DIExpression()), !dbg !115
  %0 = alloca i8, i64 100, align 16, !dbg !116
  store i8* %0, i8** %dataBuffer, align 8, !dbg !115
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !117
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !118
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !119
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !119
  store i8 0, i8* %arrayidx, align 1, !dbg !120
  %call = call i32 @staticReturnsTrue(), !dbg !121
  %tobool = icmp ne i32 %call, 0, !dbg !121
  br i1 %tobool, label %if.then, label %if.end, !dbg !123

if.then:                                          ; preds = %entry
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !124
  store i8* %3, i8** %data, align 8, !dbg !126
  br label %if.end, !dbg !127

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !128, metadata !DIExpression()), !dbg !130
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !131
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !131
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !132
  store i8 0, i8* %arrayidx1, align 1, !dbg !133
  %4 = load i8*, i8** %data, align 8, !dbg !134
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !135
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %4, i8* align 16 %arraydecay2, i64 100, i1 false), !dbg !135
  %5 = load i8*, i8** %data, align 8, !dbg !136
  %arrayidx3 = getelementptr inbounds i8, i8* %5, i64 99, !dbg !136
  store i8 0, i8* %arrayidx3, align 1, !dbg !137
  %6 = load i8*, i8** %data, align 8, !dbg !138
  call void @printLine(i8* %6), !dbg !139
  ret void, !dbg !140
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__char_alloca_memcpy_08.c", directory: "/home/joelyang/SSE-Assessment")
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
!13 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__char_alloca_memcpy_08_bad", scope: !14, file: !14, line: 37, type: !15, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__char_alloca_memcpy_08.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 39, type: !4)
!18 = !DILocation(line: 39, column: 12, scope: !13)
!19 = !DILocalVariable(name: "dataBuffer", scope: !13, file: !14, line: 40, type: !4)
!20 = !DILocation(line: 40, column: 12, scope: !13)
!21 = !DILocation(line: 40, column: 33, scope: !13)
!22 = !DILocation(line: 41, column: 12, scope: !13)
!23 = !DILocation(line: 41, column: 5, scope: !13)
!24 = !DILocation(line: 42, column: 5, scope: !13)
!25 = !DILocation(line: 42, column: 23, scope: !13)
!26 = !DILocation(line: 43, column: 8, scope: !27)
!27 = distinct !DILexicalBlock(scope: !13, file: !14, line: 43, column: 8)
!28 = !DILocation(line: 43, column: 8, scope: !13)
!29 = !DILocation(line: 46, column: 16, scope: !30)
!30 = distinct !DILexicalBlock(scope: !27, file: !14, line: 44, column: 5)
!31 = !DILocation(line: 46, column: 27, scope: !30)
!32 = !DILocation(line: 46, column: 14, scope: !30)
!33 = !DILocation(line: 47, column: 5, scope: !30)
!34 = !DILocalVariable(name: "source", scope: !35, file: !14, line: 49, type: !36)
!35 = distinct !DILexicalBlock(scope: !13, file: !14, line: 48, column: 5)
!36 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !37)
!37 = !{!38}
!38 = !DISubrange(count: 100)
!39 = !DILocation(line: 49, column: 14, scope: !35)
!40 = !DILocation(line: 50, column: 9, scope: !35)
!41 = !DILocation(line: 51, column: 9, scope: !35)
!42 = !DILocation(line: 51, column: 23, scope: !35)
!43 = !DILocation(line: 53, column: 16, scope: !35)
!44 = !DILocation(line: 53, column: 9, scope: !35)
!45 = !DILocation(line: 55, column: 9, scope: !35)
!46 = !DILocation(line: 55, column: 21, scope: !35)
!47 = !DILocation(line: 56, column: 19, scope: !35)
!48 = !DILocation(line: 56, column: 9, scope: !35)
!49 = !DILocation(line: 58, column: 1, scope: !13)
!50 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__char_alloca_memcpy_08_good", scope: !14, file: !14, line: 117, type: !15, scopeLine: 118, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!51 = !DILocation(line: 119, column: 5, scope: !50)
!52 = !DILocation(line: 120, column: 5, scope: !50)
!53 = !DILocation(line: 121, column: 1, scope: !50)
!54 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 133, type: !55, scopeLine: 134, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!55 = !DISubroutineType(types: !56)
!56 = !{!57, !57, !58}
!57 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!58 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!59 = !DILocalVariable(name: "argc", arg: 1, scope: !54, file: !14, line: 133, type: !57)
!60 = !DILocation(line: 133, column: 14, scope: !54)
!61 = !DILocalVariable(name: "argv", arg: 2, scope: !54, file: !14, line: 133, type: !58)
!62 = !DILocation(line: 133, column: 27, scope: !54)
!63 = !DILocation(line: 136, column: 22, scope: !54)
!64 = !DILocation(line: 136, column: 12, scope: !54)
!65 = !DILocation(line: 136, column: 5, scope: !54)
!66 = !DILocation(line: 138, column: 5, scope: !54)
!67 = !DILocation(line: 139, column: 5, scope: !54)
!68 = !DILocation(line: 140, column: 5, scope: !54)
!69 = !DILocation(line: 143, column: 5, scope: !54)
!70 = !DILocation(line: 144, column: 5, scope: !54)
!71 = !DILocation(line: 145, column: 5, scope: !54)
!72 = !DILocation(line: 147, column: 5, scope: !54)
!73 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !14, file: !14, line: 25, type: !74, scopeLine: 26, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!74 = !DISubroutineType(types: !75)
!75 = !{!57}
!76 = !DILocation(line: 27, column: 5, scope: !73)
!77 = distinct !DISubprogram(name: "goodG2B1", scope: !14, file: !14, line: 65, type: !15, scopeLine: 66, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!78 = !DILocalVariable(name: "data", scope: !77, file: !14, line: 67, type: !4)
!79 = !DILocation(line: 67, column: 12, scope: !77)
!80 = !DILocalVariable(name: "dataBuffer", scope: !77, file: !14, line: 68, type: !4)
!81 = !DILocation(line: 68, column: 12, scope: !77)
!82 = !DILocation(line: 68, column: 33, scope: !77)
!83 = !DILocation(line: 69, column: 12, scope: !77)
!84 = !DILocation(line: 69, column: 5, scope: !77)
!85 = !DILocation(line: 70, column: 5, scope: !77)
!86 = !DILocation(line: 70, column: 23, scope: !77)
!87 = !DILocation(line: 71, column: 8, scope: !88)
!88 = distinct !DILexicalBlock(scope: !77, file: !14, line: 71, column: 8)
!89 = !DILocation(line: 71, column: 8, scope: !77)
!90 = !DILocation(line: 74, column: 9, scope: !91)
!91 = distinct !DILexicalBlock(scope: !88, file: !14, line: 72, column: 5)
!92 = !DILocation(line: 75, column: 5, scope: !91)
!93 = !DILocation(line: 79, column: 16, scope: !94)
!94 = distinct !DILexicalBlock(scope: !88, file: !14, line: 77, column: 5)
!95 = !DILocation(line: 79, column: 14, scope: !94)
!96 = !DILocalVariable(name: "source", scope: !97, file: !14, line: 82, type: !36)
!97 = distinct !DILexicalBlock(scope: !77, file: !14, line: 81, column: 5)
!98 = !DILocation(line: 82, column: 14, scope: !97)
!99 = !DILocation(line: 83, column: 9, scope: !97)
!100 = !DILocation(line: 84, column: 9, scope: !97)
!101 = !DILocation(line: 84, column: 23, scope: !97)
!102 = !DILocation(line: 86, column: 16, scope: !97)
!103 = !DILocation(line: 86, column: 9, scope: !97)
!104 = !DILocation(line: 88, column: 9, scope: !97)
!105 = !DILocation(line: 88, column: 21, scope: !97)
!106 = !DILocation(line: 89, column: 19, scope: !97)
!107 = !DILocation(line: 89, column: 9, scope: !97)
!108 = !DILocation(line: 91, column: 1, scope: !77)
!109 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !14, file: !14, line: 30, type: !74, scopeLine: 31, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!110 = !DILocation(line: 32, column: 5, scope: !109)
!111 = distinct !DISubprogram(name: "goodG2B2", scope: !14, file: !14, line: 94, type: !15, scopeLine: 95, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!112 = !DILocalVariable(name: "data", scope: !111, file: !14, line: 96, type: !4)
!113 = !DILocation(line: 96, column: 12, scope: !111)
!114 = !DILocalVariable(name: "dataBuffer", scope: !111, file: !14, line: 97, type: !4)
!115 = !DILocation(line: 97, column: 12, scope: !111)
!116 = !DILocation(line: 97, column: 33, scope: !111)
!117 = !DILocation(line: 98, column: 12, scope: !111)
!118 = !DILocation(line: 98, column: 5, scope: !111)
!119 = !DILocation(line: 99, column: 5, scope: !111)
!120 = !DILocation(line: 99, column: 23, scope: !111)
!121 = !DILocation(line: 100, column: 8, scope: !122)
!122 = distinct !DILexicalBlock(scope: !111, file: !14, line: 100, column: 8)
!123 = !DILocation(line: 100, column: 8, scope: !111)
!124 = !DILocation(line: 103, column: 16, scope: !125)
!125 = distinct !DILexicalBlock(scope: !122, file: !14, line: 101, column: 5)
!126 = !DILocation(line: 103, column: 14, scope: !125)
!127 = !DILocation(line: 104, column: 5, scope: !125)
!128 = !DILocalVariable(name: "source", scope: !129, file: !14, line: 106, type: !36)
!129 = distinct !DILexicalBlock(scope: !111, file: !14, line: 105, column: 5)
!130 = !DILocation(line: 106, column: 14, scope: !129)
!131 = !DILocation(line: 107, column: 9, scope: !129)
!132 = !DILocation(line: 108, column: 9, scope: !129)
!133 = !DILocation(line: 108, column: 23, scope: !129)
!134 = !DILocation(line: 110, column: 16, scope: !129)
!135 = !DILocation(line: 110, column: 9, scope: !129)
!136 = !DILocation(line: 112, column: 9, scope: !129)
!137 = !DILocation(line: 112, column: 21, scope: !129)
!138 = !DILocation(line: 113, column: 19, scope: !129)
!139 = !DILocation(line: 113, column: 9, scope: !129)
!140 = !DILocation(line: 115, column: 1, scope: !111)
