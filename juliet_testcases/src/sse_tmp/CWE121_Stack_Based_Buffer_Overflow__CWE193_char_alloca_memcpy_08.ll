; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memcpy_08.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memcpy_08.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memcpy_08_bad.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@__const.goodG2B1.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@__const.goodG2B2.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memcpy_08_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !19, metadata !DIExpression()), !dbg !20
  %0 = alloca i8, i64 10, align 16, !dbg !21
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !20
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !22, metadata !DIExpression()), !dbg !23
  %1 = alloca i8, i64 11, align 16, !dbg !24
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
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !34, metadata !DIExpression()), !dbg !39
  %4 = bitcast [11 x i8]* %source to i8*, !dbg !39
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %4, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memcpy_08_bad.source, i32 0, i32 0), i64 11, i1 false), !dbg !39
  %5 = load i8*, i8** %data, align 8, !dbg !40
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !41
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !42
  %call2 = call i64 @strlen(i8* %arraydecay1) #6, !dbg !43
  %add = add i64 %call2, 1, !dbg !44
  %mul = mul i64 %add, 1, !dbg !45
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %5, i8* align 1 %arraydecay, i64 %mul, i1 false), !dbg !41
  %6 = load i8*, i8** %data, align 8, !dbg !46
  call void @printLine(i8* %6), !dbg !47
  ret void, !dbg !48
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memcpy_08_good() #0 !dbg !49 {
entry:
  call void @goodG2B1(), !dbg !50
  call void @goodG2B2(), !dbg !51
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
  %call = call i64 @time(i64* null) #7, !dbg !62
  %conv = trunc i64 %call to i32, !dbg !63
  call void @srand(i32 %conv) #7, !dbg !64
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !65
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memcpy_08_good(), !dbg !66
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !67
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !68
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memcpy_08_bad(), !dbg !69
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !70
  ret i32 0, !dbg !71
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !72 {
entry:
  ret i32 1, !dbg !75
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !76 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !77, metadata !DIExpression()), !dbg !78
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !79, metadata !DIExpression()), !dbg !80
  %0 = alloca i8, i64 10, align 16, !dbg !81
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !80
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !82, metadata !DIExpression()), !dbg !83
  %1 = alloca i8, i64 11, align 16, !dbg !84
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !83
  %call = call i32 @staticReturnsFalse(), !dbg !85
  %tobool = icmp ne i32 %call, 0, !dbg !85
  br i1 %tobool, label %if.then, label %if.else, !dbg !87

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !88
  br label %if.end, !dbg !90

if.else:                                          ; preds = %entry
  %2 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !91
  store i8* %2, i8** %data, align 8, !dbg !93
  %3 = load i8*, i8** %data, align 8, !dbg !94
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !94
  store i8 0, i8* %arrayidx, align 1, !dbg !95
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !96, metadata !DIExpression()), !dbg !98
  %4 = bitcast [11 x i8]* %source to i8*, !dbg !98
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %4, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B1.source, i32 0, i32 0), i64 11, i1 false), !dbg !98
  %5 = load i8*, i8** %data, align 8, !dbg !99
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !100
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !101
  %call2 = call i64 @strlen(i8* %arraydecay1) #6, !dbg !102
  %add = add i64 %call2, 1, !dbg !103
  %mul = mul i64 %add, 1, !dbg !104
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %5, i8* align 1 %arraydecay, i64 %mul, i1 false), !dbg !100
  %6 = load i8*, i8** %data, align 8, !dbg !105
  call void @printLine(i8* %6), !dbg !106
  ret void, !dbg !107
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !108 {
entry:
  ret i32 0, !dbg !109
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !110 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !111, metadata !DIExpression()), !dbg !112
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !113, metadata !DIExpression()), !dbg !114
  %0 = alloca i8, i64 10, align 16, !dbg !115
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !114
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !116, metadata !DIExpression()), !dbg !117
  %1 = alloca i8, i64 11, align 16, !dbg !118
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !117
  %call = call i32 @staticReturnsTrue(), !dbg !119
  %tobool = icmp ne i32 %call, 0, !dbg !119
  br i1 %tobool, label %if.then, label %if.end, !dbg !121

if.then:                                          ; preds = %entry
  %2 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !122
  store i8* %2, i8** %data, align 8, !dbg !124
  %3 = load i8*, i8** %data, align 8, !dbg !125
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !125
  store i8 0, i8* %arrayidx, align 1, !dbg !126
  br label %if.end, !dbg !127

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !128, metadata !DIExpression()), !dbg !130
  %4 = bitcast [11 x i8]* %source to i8*, !dbg !130
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %4, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B2.source, i32 0, i32 0), i64 11, i1 false), !dbg !130
  %5 = load i8*, i8** %data, align 8, !dbg !131
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !132
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !133
  %call2 = call i64 @strlen(i8* %arraydecay1) #6, !dbg !134
  %add = add i64 %call2, 1, !dbg !135
  %mul = mul i64 %add, 1, !dbg !136
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %5, i8* align 1 %arraydecay, i64 %mul, i1 false), !dbg !132
  %6 = load i8*, i8** %data, align 8, !dbg !137
  call void @printLine(i8* %6), !dbg !138
  ret void, !dbg !139
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memcpy_08.c", directory: "/home/joelyang/SSE-Assessment")
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
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memcpy_08_bad", scope: !14, file: !14, line: 42, type: !15, scopeLine: 43, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memcpy_08.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 44, type: !4)
!18 = !DILocation(line: 44, column: 12, scope: !13)
!19 = !DILocalVariable(name: "dataBadBuffer", scope: !13, file: !14, line: 45, type: !4)
!20 = !DILocation(line: 45, column: 12, scope: !13)
!21 = !DILocation(line: 45, column: 36, scope: !13)
!22 = !DILocalVariable(name: "dataGoodBuffer", scope: !13, file: !14, line: 46, type: !4)
!23 = !DILocation(line: 46, column: 12, scope: !13)
!24 = !DILocation(line: 46, column: 37, scope: !13)
!25 = !DILocation(line: 47, column: 8, scope: !26)
!26 = distinct !DILexicalBlock(scope: !13, file: !14, line: 47, column: 8)
!27 = !DILocation(line: 47, column: 8, scope: !13)
!28 = !DILocation(line: 51, column: 16, scope: !29)
!29 = distinct !DILexicalBlock(scope: !26, file: !14, line: 48, column: 5)
!30 = !DILocation(line: 51, column: 14, scope: !29)
!31 = !DILocation(line: 52, column: 9, scope: !29)
!32 = !DILocation(line: 52, column: 17, scope: !29)
!33 = !DILocation(line: 53, column: 5, scope: !29)
!34 = !DILocalVariable(name: "source", scope: !35, file: !14, line: 55, type: !36)
!35 = distinct !DILexicalBlock(scope: !13, file: !14, line: 54, column: 5)
!36 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 88, elements: !37)
!37 = !{!38}
!38 = !DISubrange(count: 11)
!39 = !DILocation(line: 55, column: 14, scope: !35)
!40 = !DILocation(line: 58, column: 16, scope: !35)
!41 = !DILocation(line: 58, column: 9, scope: !35)
!42 = !DILocation(line: 58, column: 38, scope: !35)
!43 = !DILocation(line: 58, column: 31, scope: !35)
!44 = !DILocation(line: 58, column: 46, scope: !35)
!45 = !DILocation(line: 58, column: 51, scope: !35)
!46 = !DILocation(line: 59, column: 19, scope: !35)
!47 = !DILocation(line: 59, column: 9, scope: !35)
!48 = !DILocation(line: 61, column: 1, scope: !13)
!49 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memcpy_08_good", scope: !14, file: !14, line: 116, type: !15, scopeLine: 117, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!50 = !DILocation(line: 118, column: 5, scope: !49)
!51 = !DILocation(line: 119, column: 5, scope: !49)
!52 = !DILocation(line: 120, column: 1, scope: !49)
!53 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 132, type: !54, scopeLine: 133, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!54 = !DISubroutineType(types: !55)
!55 = !{!56, !56, !57}
!56 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!57 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!58 = !DILocalVariable(name: "argc", arg: 1, scope: !53, file: !14, line: 132, type: !56)
!59 = !DILocation(line: 132, column: 14, scope: !53)
!60 = !DILocalVariable(name: "argv", arg: 2, scope: !53, file: !14, line: 132, type: !57)
!61 = !DILocation(line: 132, column: 27, scope: !53)
!62 = !DILocation(line: 135, column: 22, scope: !53)
!63 = !DILocation(line: 135, column: 12, scope: !53)
!64 = !DILocation(line: 135, column: 5, scope: !53)
!65 = !DILocation(line: 137, column: 5, scope: !53)
!66 = !DILocation(line: 138, column: 5, scope: !53)
!67 = !DILocation(line: 139, column: 5, scope: !53)
!68 = !DILocation(line: 142, column: 5, scope: !53)
!69 = !DILocation(line: 143, column: 5, scope: !53)
!70 = !DILocation(line: 144, column: 5, scope: !53)
!71 = !DILocation(line: 146, column: 5, scope: !53)
!72 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !14, file: !14, line: 30, type: !73, scopeLine: 31, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!73 = !DISubroutineType(types: !74)
!74 = !{!56}
!75 = !DILocation(line: 32, column: 5, scope: !72)
!76 = distinct !DISubprogram(name: "goodG2B1", scope: !14, file: !14, line: 68, type: !15, scopeLine: 69, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!77 = !DILocalVariable(name: "data", scope: !76, file: !14, line: 70, type: !4)
!78 = !DILocation(line: 70, column: 12, scope: !76)
!79 = !DILocalVariable(name: "dataBadBuffer", scope: !76, file: !14, line: 71, type: !4)
!80 = !DILocation(line: 71, column: 12, scope: !76)
!81 = !DILocation(line: 71, column: 36, scope: !76)
!82 = !DILocalVariable(name: "dataGoodBuffer", scope: !76, file: !14, line: 72, type: !4)
!83 = !DILocation(line: 72, column: 12, scope: !76)
!84 = !DILocation(line: 72, column: 37, scope: !76)
!85 = !DILocation(line: 73, column: 8, scope: !86)
!86 = distinct !DILexicalBlock(scope: !76, file: !14, line: 73, column: 8)
!87 = !DILocation(line: 73, column: 8, scope: !76)
!88 = !DILocation(line: 76, column: 9, scope: !89)
!89 = distinct !DILexicalBlock(scope: !86, file: !14, line: 74, column: 5)
!90 = !DILocation(line: 77, column: 5, scope: !89)
!91 = !DILocation(line: 82, column: 16, scope: !92)
!92 = distinct !DILexicalBlock(scope: !86, file: !14, line: 79, column: 5)
!93 = !DILocation(line: 82, column: 14, scope: !92)
!94 = !DILocation(line: 83, column: 9, scope: !92)
!95 = !DILocation(line: 83, column: 17, scope: !92)
!96 = !DILocalVariable(name: "source", scope: !97, file: !14, line: 86, type: !36)
!97 = distinct !DILexicalBlock(scope: !76, file: !14, line: 85, column: 5)
!98 = !DILocation(line: 86, column: 14, scope: !97)
!99 = !DILocation(line: 89, column: 16, scope: !97)
!100 = !DILocation(line: 89, column: 9, scope: !97)
!101 = !DILocation(line: 89, column: 38, scope: !97)
!102 = !DILocation(line: 89, column: 31, scope: !97)
!103 = !DILocation(line: 89, column: 46, scope: !97)
!104 = !DILocation(line: 89, column: 51, scope: !97)
!105 = !DILocation(line: 90, column: 19, scope: !97)
!106 = !DILocation(line: 90, column: 9, scope: !97)
!107 = !DILocation(line: 92, column: 1, scope: !76)
!108 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !14, file: !14, line: 35, type: !73, scopeLine: 36, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!109 = !DILocation(line: 37, column: 5, scope: !108)
!110 = distinct !DISubprogram(name: "goodG2B2", scope: !14, file: !14, line: 95, type: !15, scopeLine: 96, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!111 = !DILocalVariable(name: "data", scope: !110, file: !14, line: 97, type: !4)
!112 = !DILocation(line: 97, column: 12, scope: !110)
!113 = !DILocalVariable(name: "dataBadBuffer", scope: !110, file: !14, line: 98, type: !4)
!114 = !DILocation(line: 98, column: 12, scope: !110)
!115 = !DILocation(line: 98, column: 36, scope: !110)
!116 = !DILocalVariable(name: "dataGoodBuffer", scope: !110, file: !14, line: 99, type: !4)
!117 = !DILocation(line: 99, column: 12, scope: !110)
!118 = !DILocation(line: 99, column: 37, scope: !110)
!119 = !DILocation(line: 100, column: 8, scope: !120)
!120 = distinct !DILexicalBlock(scope: !110, file: !14, line: 100, column: 8)
!121 = !DILocation(line: 100, column: 8, scope: !110)
!122 = !DILocation(line: 104, column: 16, scope: !123)
!123 = distinct !DILexicalBlock(scope: !120, file: !14, line: 101, column: 5)
!124 = !DILocation(line: 104, column: 14, scope: !123)
!125 = !DILocation(line: 105, column: 9, scope: !123)
!126 = !DILocation(line: 105, column: 17, scope: !123)
!127 = !DILocation(line: 106, column: 5, scope: !123)
!128 = !DILocalVariable(name: "source", scope: !129, file: !14, line: 108, type: !36)
!129 = distinct !DILexicalBlock(scope: !110, file: !14, line: 107, column: 5)
!130 = !DILocation(line: 108, column: 14, scope: !129)
!131 = !DILocation(line: 111, column: 16, scope: !129)
!132 = !DILocation(line: 111, column: 9, scope: !129)
!133 = !DILocation(line: 111, column: 38, scope: !129)
!134 = !DILocation(line: 111, column: 31, scope: !129)
!135 = !DILocation(line: 111, column: 46, scope: !129)
!136 = !DILocation(line: 111, column: 51, scope: !129)
!137 = !DILocation(line: 112, column: 19, scope: !129)
!138 = !DILocation(line: 112, column: 9, scope: !129)
!139 = !DILocation(line: 114, column: 1, scope: !110)
