; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_08.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_08.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_08_bad() #0 !dbg !13 {
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
  %call = call i32 @staticReturnsTrue(), !dbg !25
  %tobool = icmp ne i32 %call, 0, !dbg !25
  br i1 %tobool, label %if.then, label %if.end, !dbg !27

if.then:                                          ; preds = %entry
  %2 = load i8*, i8** %dataBadBuffer, align 8, !dbg !28
  store i8* %2, i8** %data, align 8, !dbg !30
  %3 = load i8*, i8** %data, align 8, !dbg !31
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !31
  store i8 0, i8* %arrayidx, align 1, !dbg !32
  br label %if.end, !dbg !33

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !34, metadata !DIExpression()), !dbg !39
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !40
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !40
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !41
  store i8 0, i8* %arrayidx1, align 1, !dbg !42
  %4 = load i8*, i8** %data, align 8, !dbg !43
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !44
  %call3 = call i8* @strncpy(i8* %4, i8* %arraydecay2, i64 99) #5, !dbg !45
  %5 = load i8*, i8** %data, align 8, !dbg !46
  %arrayidx4 = getelementptr inbounds i8, i8* %5, i64 99, !dbg !46
  store i8 0, i8* %arrayidx4, align 1, !dbg !47
  %6 = load i8*, i8** %data, align 8, !dbg !48
  call void @printLine(i8* %6), !dbg !49
  ret void, !dbg !50
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i8* @strncpy(i8*, i8*, i64) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_08_good() #0 !dbg !51 {
entry:
  call void @goodG2B1(), !dbg !52
  call void @goodG2B2(), !dbg !53
  ret void, !dbg !54
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !55 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !60, metadata !DIExpression()), !dbg !61
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !62, metadata !DIExpression()), !dbg !63
  %call = call i64 @time(i64* null) #5, !dbg !64
  %conv = trunc i64 %call to i32, !dbg !65
  call void @srand(i32 %conv) #5, !dbg !66
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !67
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_08_good(), !dbg !68
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !69
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !70
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_08_bad(), !dbg !71
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !72
  ret i32 0, !dbg !73
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !74 {
entry:
  ret i32 1, !dbg !77
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !78 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !79, metadata !DIExpression()), !dbg !80
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !81, metadata !DIExpression()), !dbg !82
  %0 = alloca i8, i64 50, align 16, !dbg !83
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !82
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !84, metadata !DIExpression()), !dbg !85
  %1 = alloca i8, i64 100, align 16, !dbg !86
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !85
  %call = call i32 @staticReturnsFalse(), !dbg !87
  %tobool = icmp ne i32 %call, 0, !dbg !87
  br i1 %tobool, label %if.then, label %if.else, !dbg !89

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !90
  br label %if.end, !dbg !92

if.else:                                          ; preds = %entry
  %2 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !93
  store i8* %2, i8** %data, align 8, !dbg !95
  %3 = load i8*, i8** %data, align 8, !dbg !96
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !96
  store i8 0, i8* %arrayidx, align 1, !dbg !97
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !98, metadata !DIExpression()), !dbg !100
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !101
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !101
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !102
  store i8 0, i8* %arrayidx1, align 1, !dbg !103
  %4 = load i8*, i8** %data, align 8, !dbg !104
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !105
  %call3 = call i8* @strncpy(i8* %4, i8* %arraydecay2, i64 99) #5, !dbg !106
  %5 = load i8*, i8** %data, align 8, !dbg !107
  %arrayidx4 = getelementptr inbounds i8, i8* %5, i64 99, !dbg !107
  store i8 0, i8* %arrayidx4, align 1, !dbg !108
  %6 = load i8*, i8** %data, align 8, !dbg !109
  call void @printLine(i8* %6), !dbg !110
  ret void, !dbg !111
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !112 {
entry:
  ret i32 0, !dbg !113
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !114 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !115, metadata !DIExpression()), !dbg !116
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !117, metadata !DIExpression()), !dbg !118
  %0 = alloca i8, i64 50, align 16, !dbg !119
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !118
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !120, metadata !DIExpression()), !dbg !121
  %1 = alloca i8, i64 100, align 16, !dbg !122
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !121
  %call = call i32 @staticReturnsTrue(), !dbg !123
  %tobool = icmp ne i32 %call, 0, !dbg !123
  br i1 %tobool, label %if.then, label %if.end, !dbg !125

if.then:                                          ; preds = %entry
  %2 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !126
  store i8* %2, i8** %data, align 8, !dbg !128
  %3 = load i8*, i8** %data, align 8, !dbg !129
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !129
  store i8 0, i8* %arrayidx, align 1, !dbg !130
  br label %if.end, !dbg !131

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !132, metadata !DIExpression()), !dbg !134
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !135
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !135
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !136
  store i8 0, i8* %arrayidx1, align 1, !dbg !137
  %4 = load i8*, i8** %data, align 8, !dbg !138
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !139
  %call3 = call i8* @strncpy(i8* %4, i8* %arraydecay2, i64 99) #5, !dbg !140
  %5 = load i8*, i8** %data, align 8, !dbg !141
  %arrayidx4 = getelementptr inbounds i8, i8* %5, i64 99, !dbg !141
  store i8 0, i8* %arrayidx4, align 1, !dbg !142
  %6 = load i8*, i8** %data, align 8, !dbg !143
  call void @printLine(i8* %6), !dbg !144
  ret void, !dbg !145
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_08.c", directory: "/root/SSE-Assessment")
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
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_08_bad", scope: !14, file: !14, line: 37, type: !15, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_08.c", directory: "/root/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 39, type: !4)
!18 = !DILocation(line: 39, column: 12, scope: !13)
!19 = !DILocalVariable(name: "dataBadBuffer", scope: !13, file: !14, line: 40, type: !4)
!20 = !DILocation(line: 40, column: 12, scope: !13)
!21 = !DILocation(line: 40, column: 36, scope: !13)
!22 = !DILocalVariable(name: "dataGoodBuffer", scope: !13, file: !14, line: 41, type: !4)
!23 = !DILocation(line: 41, column: 12, scope: !13)
!24 = !DILocation(line: 41, column: 37, scope: !13)
!25 = !DILocation(line: 42, column: 8, scope: !26)
!26 = distinct !DILexicalBlock(scope: !13, file: !14, line: 42, column: 8)
!27 = !DILocation(line: 42, column: 8, scope: !13)
!28 = !DILocation(line: 46, column: 16, scope: !29)
!29 = distinct !DILexicalBlock(scope: !26, file: !14, line: 43, column: 5)
!30 = !DILocation(line: 46, column: 14, scope: !29)
!31 = !DILocation(line: 47, column: 9, scope: !29)
!32 = !DILocation(line: 47, column: 17, scope: !29)
!33 = !DILocation(line: 48, column: 5, scope: !29)
!34 = !DILocalVariable(name: "source", scope: !35, file: !14, line: 50, type: !36)
!35 = distinct !DILexicalBlock(scope: !13, file: !14, line: 49, column: 5)
!36 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !37)
!37 = !{!38}
!38 = !DISubrange(count: 100)
!39 = !DILocation(line: 50, column: 14, scope: !35)
!40 = !DILocation(line: 51, column: 9, scope: !35)
!41 = !DILocation(line: 52, column: 9, scope: !35)
!42 = !DILocation(line: 52, column: 23, scope: !35)
!43 = !DILocation(line: 54, column: 17, scope: !35)
!44 = !DILocation(line: 54, column: 23, scope: !35)
!45 = !DILocation(line: 54, column: 9, scope: !35)
!46 = !DILocation(line: 55, column: 9, scope: !35)
!47 = !DILocation(line: 55, column: 21, scope: !35)
!48 = !DILocation(line: 56, column: 19, scope: !35)
!49 = !DILocation(line: 56, column: 9, scope: !35)
!50 = !DILocation(line: 58, column: 1, scope: !13)
!51 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_08_good", scope: !14, file: !14, line: 115, type: !15, scopeLine: 116, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!52 = !DILocation(line: 117, column: 5, scope: !51)
!53 = !DILocation(line: 118, column: 5, scope: !51)
!54 = !DILocation(line: 119, column: 1, scope: !51)
!55 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 131, type: !56, scopeLine: 132, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!56 = !DISubroutineType(types: !57)
!57 = !{!58, !58, !59}
!58 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!59 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!60 = !DILocalVariable(name: "argc", arg: 1, scope: !55, file: !14, line: 131, type: !58)
!61 = !DILocation(line: 131, column: 14, scope: !55)
!62 = !DILocalVariable(name: "argv", arg: 2, scope: !55, file: !14, line: 131, type: !59)
!63 = !DILocation(line: 131, column: 27, scope: !55)
!64 = !DILocation(line: 134, column: 22, scope: !55)
!65 = !DILocation(line: 134, column: 12, scope: !55)
!66 = !DILocation(line: 134, column: 5, scope: !55)
!67 = !DILocation(line: 136, column: 5, scope: !55)
!68 = !DILocation(line: 137, column: 5, scope: !55)
!69 = !DILocation(line: 138, column: 5, scope: !55)
!70 = !DILocation(line: 141, column: 5, scope: !55)
!71 = !DILocation(line: 142, column: 5, scope: !55)
!72 = !DILocation(line: 143, column: 5, scope: !55)
!73 = !DILocation(line: 145, column: 5, scope: !55)
!74 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !14, file: !14, line: 25, type: !75, scopeLine: 26, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!75 = !DISubroutineType(types: !76)
!76 = !{!58}
!77 = !DILocation(line: 27, column: 5, scope: !74)
!78 = distinct !DISubprogram(name: "goodG2B1", scope: !14, file: !14, line: 65, type: !15, scopeLine: 66, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!79 = !DILocalVariable(name: "data", scope: !78, file: !14, line: 67, type: !4)
!80 = !DILocation(line: 67, column: 12, scope: !78)
!81 = !DILocalVariable(name: "dataBadBuffer", scope: !78, file: !14, line: 68, type: !4)
!82 = !DILocation(line: 68, column: 12, scope: !78)
!83 = !DILocation(line: 68, column: 36, scope: !78)
!84 = !DILocalVariable(name: "dataGoodBuffer", scope: !78, file: !14, line: 69, type: !4)
!85 = !DILocation(line: 69, column: 12, scope: !78)
!86 = !DILocation(line: 69, column: 37, scope: !78)
!87 = !DILocation(line: 70, column: 8, scope: !88)
!88 = distinct !DILexicalBlock(scope: !78, file: !14, line: 70, column: 8)
!89 = !DILocation(line: 70, column: 8, scope: !78)
!90 = !DILocation(line: 73, column: 9, scope: !91)
!91 = distinct !DILexicalBlock(scope: !88, file: !14, line: 71, column: 5)
!92 = !DILocation(line: 74, column: 5, scope: !91)
!93 = !DILocation(line: 78, column: 16, scope: !94)
!94 = distinct !DILexicalBlock(scope: !88, file: !14, line: 76, column: 5)
!95 = !DILocation(line: 78, column: 14, scope: !94)
!96 = !DILocation(line: 79, column: 9, scope: !94)
!97 = !DILocation(line: 79, column: 17, scope: !94)
!98 = !DILocalVariable(name: "source", scope: !99, file: !14, line: 82, type: !36)
!99 = distinct !DILexicalBlock(scope: !78, file: !14, line: 81, column: 5)
!100 = !DILocation(line: 82, column: 14, scope: !99)
!101 = !DILocation(line: 83, column: 9, scope: !99)
!102 = !DILocation(line: 84, column: 9, scope: !99)
!103 = !DILocation(line: 84, column: 23, scope: !99)
!104 = !DILocation(line: 86, column: 17, scope: !99)
!105 = !DILocation(line: 86, column: 23, scope: !99)
!106 = !DILocation(line: 86, column: 9, scope: !99)
!107 = !DILocation(line: 87, column: 9, scope: !99)
!108 = !DILocation(line: 87, column: 21, scope: !99)
!109 = !DILocation(line: 88, column: 19, scope: !99)
!110 = !DILocation(line: 88, column: 9, scope: !99)
!111 = !DILocation(line: 90, column: 1, scope: !78)
!112 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !14, file: !14, line: 30, type: !75, scopeLine: 31, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!113 = !DILocation(line: 32, column: 5, scope: !112)
!114 = distinct !DISubprogram(name: "goodG2B2", scope: !14, file: !14, line: 93, type: !15, scopeLine: 94, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!115 = !DILocalVariable(name: "data", scope: !114, file: !14, line: 95, type: !4)
!116 = !DILocation(line: 95, column: 12, scope: !114)
!117 = !DILocalVariable(name: "dataBadBuffer", scope: !114, file: !14, line: 96, type: !4)
!118 = !DILocation(line: 96, column: 12, scope: !114)
!119 = !DILocation(line: 96, column: 36, scope: !114)
!120 = !DILocalVariable(name: "dataGoodBuffer", scope: !114, file: !14, line: 97, type: !4)
!121 = !DILocation(line: 97, column: 12, scope: !114)
!122 = !DILocation(line: 97, column: 37, scope: !114)
!123 = !DILocation(line: 98, column: 8, scope: !124)
!124 = distinct !DILexicalBlock(scope: !114, file: !14, line: 98, column: 8)
!125 = !DILocation(line: 98, column: 8, scope: !114)
!126 = !DILocation(line: 101, column: 16, scope: !127)
!127 = distinct !DILexicalBlock(scope: !124, file: !14, line: 99, column: 5)
!128 = !DILocation(line: 101, column: 14, scope: !127)
!129 = !DILocation(line: 102, column: 9, scope: !127)
!130 = !DILocation(line: 102, column: 17, scope: !127)
!131 = !DILocation(line: 103, column: 5, scope: !127)
!132 = !DILocalVariable(name: "source", scope: !133, file: !14, line: 105, type: !36)
!133 = distinct !DILexicalBlock(scope: !114, file: !14, line: 104, column: 5)
!134 = !DILocation(line: 105, column: 14, scope: !133)
!135 = !DILocation(line: 106, column: 9, scope: !133)
!136 = !DILocation(line: 107, column: 9, scope: !133)
!137 = !DILocation(line: 107, column: 23, scope: !133)
!138 = !DILocation(line: 109, column: 17, scope: !133)
!139 = !DILocation(line: 109, column: 23, scope: !133)
!140 = !DILocation(line: 109, column: 9, scope: !133)
!141 = !DILocation(line: 110, column: 9, scope: !133)
!142 = !DILocation(line: 110, column: 21, scope: !133)
!143 = !DILocation(line: 111, column: 19, scope: !133)
!144 = !DILocation(line: 111, column: 9, scope: !133)
!145 = !DILocation(line: 113, column: 1, scope: !114)
