; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memcpy_08.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memcpy_08.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memcpy_08_bad() #0 !dbg !13 {
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
  %call = call i32 @staticReturnsTrue(), !dbg !24
  %tobool = icmp ne i32 %call, 0, !dbg !24
  br i1 %tobool, label %if.then, label %if.end, !dbg !26

if.then:                                          ; preds = %entry
  %2 = load i8*, i8** %data, align 8, !dbg !27
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 99, i1 false), !dbg !29
  %3 = load i8*, i8** %data, align 8, !dbg !30
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 99, !dbg !30
  store i8 0, i8* %arrayidx, align 1, !dbg !31
  br label %if.end, !dbg !32

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !33, metadata !DIExpression()), !dbg !38
  %4 = bitcast [50 x i8]* %dest to i8*, !dbg !38
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 50, i1 false), !dbg !38
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !39
  %5 = load i8*, i8** %data, align 8, !dbg !40
  %6 = load i8*, i8** %data, align 8, !dbg !41
  %call1 = call i64 @strlen(i8* %6) #7, !dbg !42
  %mul = mul i64 %call1, 1, !dbg !43
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %arraydecay, i8* align 1 %5, i64 %mul, i1 false), !dbg !39
  %arrayidx2 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !44
  store i8 0, i8* %arrayidx2, align 1, !dbg !45
  %7 = load i8*, i8** %data, align 8, !dbg !46
  call void @printLine(i8* %7), !dbg !47
  ret void, !dbg !48
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #3

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memcpy_08_good() #0 !dbg !49 {
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
  %call = call i64 @time(i64* null) #8, !dbg !62
  %conv = trunc i64 %call to i32, !dbg !63
  call void @srand(i32 %conv) #8, !dbg !64
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !65
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memcpy_08_good(), !dbg !66
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !67
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !68
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memcpy_08_bad(), !dbg !69
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !70
  ret i32 0, !dbg !71
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #6

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #6

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !72 {
entry:
  ret i32 1, !dbg !75
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !76 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !77, metadata !DIExpression()), !dbg !78
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !79, metadata !DIExpression()), !dbg !80
  %0 = alloca i8, i64 100, align 16, !dbg !81
  store i8* %0, i8** %dataBuffer, align 8, !dbg !80
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !82
  store i8* %1, i8** %data, align 8, !dbg !83
  %call = call i32 @staticReturnsFalse(), !dbg !84
  %tobool = icmp ne i32 %call, 0, !dbg !84
  br i1 %tobool, label %if.then, label %if.else, !dbg !86

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !87
  br label %if.end, !dbg !89

if.else:                                          ; preds = %entry
  %2 = load i8*, i8** %data, align 8, !dbg !90
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !92
  %3 = load i8*, i8** %data, align 8, !dbg !93
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !93
  store i8 0, i8* %arrayidx, align 1, !dbg !94
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !95, metadata !DIExpression()), !dbg !97
  %4 = bitcast [50 x i8]* %dest to i8*, !dbg !97
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 50, i1 false), !dbg !97
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !98
  %5 = load i8*, i8** %data, align 8, !dbg !99
  %6 = load i8*, i8** %data, align 8, !dbg !100
  %call1 = call i64 @strlen(i8* %6) #7, !dbg !101
  %mul = mul i64 %call1, 1, !dbg !102
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %arraydecay, i8* align 1 %5, i64 %mul, i1 false), !dbg !98
  %arrayidx2 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !103
  store i8 0, i8* %arrayidx2, align 1, !dbg !104
  %7 = load i8*, i8** %data, align 8, !dbg !105
  call void @printLine(i8* %7), !dbg !106
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
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !111, metadata !DIExpression()), !dbg !112
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !113, metadata !DIExpression()), !dbg !114
  %0 = alloca i8, i64 100, align 16, !dbg !115
  store i8* %0, i8** %dataBuffer, align 8, !dbg !114
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !116
  store i8* %1, i8** %data, align 8, !dbg !117
  %call = call i32 @staticReturnsTrue(), !dbg !118
  %tobool = icmp ne i32 %call, 0, !dbg !118
  br i1 %tobool, label %if.then, label %if.end, !dbg !120

if.then:                                          ; preds = %entry
  %2 = load i8*, i8** %data, align 8, !dbg !121
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !123
  %3 = load i8*, i8** %data, align 8, !dbg !124
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !124
  store i8 0, i8* %arrayidx, align 1, !dbg !125
  br label %if.end, !dbg !126

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !127, metadata !DIExpression()), !dbg !129
  %4 = bitcast [50 x i8]* %dest to i8*, !dbg !129
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 50, i1 false), !dbg !129
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !130
  %5 = load i8*, i8** %data, align 8, !dbg !131
  %6 = load i8*, i8** %data, align 8, !dbg !132
  %call1 = call i64 @strlen(i8* %6) #7, !dbg !133
  %mul = mul i64 %call1, 1, !dbg !134
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %arraydecay, i8* align 1 %5, i64 %mul, i1 false), !dbg !130
  %arrayidx2 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !135
  store i8 0, i8* %arrayidx2, align 1, !dbg !136
  %7 = load i8*, i8** %data, align 8, !dbg !137
  call void @printLine(i8* %7), !dbg !138
  ret void, !dbg !139
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind readonly willreturn }
attributes #8 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memcpy_08.c", directory: "/home/joelyang/SSE-Assessment")
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
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memcpy_08_bad", scope: !14, file: !14, line: 37, type: !15, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memcpy_08.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 39, type: !4)
!18 = !DILocation(line: 39, column: 12, scope: !13)
!19 = !DILocalVariable(name: "dataBuffer", scope: !13, file: !14, line: 40, type: !4)
!20 = !DILocation(line: 40, column: 12, scope: !13)
!21 = !DILocation(line: 40, column: 33, scope: !13)
!22 = !DILocation(line: 41, column: 12, scope: !13)
!23 = !DILocation(line: 41, column: 10, scope: !13)
!24 = !DILocation(line: 42, column: 8, scope: !25)
!25 = distinct !DILexicalBlock(scope: !13, file: !14, line: 42, column: 8)
!26 = !DILocation(line: 42, column: 8, scope: !13)
!27 = !DILocation(line: 45, column: 16, scope: !28)
!28 = distinct !DILexicalBlock(scope: !25, file: !14, line: 43, column: 5)
!29 = !DILocation(line: 45, column: 9, scope: !28)
!30 = !DILocation(line: 46, column: 9, scope: !28)
!31 = !DILocation(line: 46, column: 21, scope: !28)
!32 = !DILocation(line: 47, column: 5, scope: !28)
!33 = !DILocalVariable(name: "dest", scope: !34, file: !14, line: 49, type: !35)
!34 = distinct !DILexicalBlock(scope: !13, file: !14, line: 48, column: 5)
!35 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 400, elements: !36)
!36 = !{!37}
!37 = !DISubrange(count: 50)
!38 = !DILocation(line: 49, column: 14, scope: !34)
!39 = !DILocation(line: 51, column: 9, scope: !34)
!40 = !DILocation(line: 51, column: 22, scope: !34)
!41 = !DILocation(line: 51, column: 35, scope: !34)
!42 = !DILocation(line: 51, column: 28, scope: !34)
!43 = !DILocation(line: 51, column: 40, scope: !34)
!44 = !DILocation(line: 52, column: 9, scope: !34)
!45 = !DILocation(line: 52, column: 20, scope: !34)
!46 = !DILocation(line: 53, column: 19, scope: !34)
!47 = !DILocation(line: 53, column: 9, scope: !34)
!48 = !DILocation(line: 55, column: 1, scope: !13)
!49 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memcpy_08_good", scope: !14, file: !14, line: 108, type: !15, scopeLine: 109, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!50 = !DILocation(line: 110, column: 5, scope: !49)
!51 = !DILocation(line: 111, column: 5, scope: !49)
!52 = !DILocation(line: 112, column: 1, scope: !49)
!53 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 124, type: !54, scopeLine: 125, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!54 = !DISubroutineType(types: !55)
!55 = !{!56, !56, !57}
!56 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!57 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!58 = !DILocalVariable(name: "argc", arg: 1, scope: !53, file: !14, line: 124, type: !56)
!59 = !DILocation(line: 124, column: 14, scope: !53)
!60 = !DILocalVariable(name: "argv", arg: 2, scope: !53, file: !14, line: 124, type: !57)
!61 = !DILocation(line: 124, column: 27, scope: !53)
!62 = !DILocation(line: 127, column: 22, scope: !53)
!63 = !DILocation(line: 127, column: 12, scope: !53)
!64 = !DILocation(line: 127, column: 5, scope: !53)
!65 = !DILocation(line: 129, column: 5, scope: !53)
!66 = !DILocation(line: 130, column: 5, scope: !53)
!67 = !DILocation(line: 131, column: 5, scope: !53)
!68 = !DILocation(line: 134, column: 5, scope: !53)
!69 = !DILocation(line: 135, column: 5, scope: !53)
!70 = !DILocation(line: 136, column: 5, scope: !53)
!71 = !DILocation(line: 138, column: 5, scope: !53)
!72 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !14, file: !14, line: 25, type: !73, scopeLine: 26, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!73 = !DISubroutineType(types: !74)
!74 = !{!56}
!75 = !DILocation(line: 27, column: 5, scope: !72)
!76 = distinct !DISubprogram(name: "goodG2B1", scope: !14, file: !14, line: 62, type: !15, scopeLine: 63, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!77 = !DILocalVariable(name: "data", scope: !76, file: !14, line: 64, type: !4)
!78 = !DILocation(line: 64, column: 12, scope: !76)
!79 = !DILocalVariable(name: "dataBuffer", scope: !76, file: !14, line: 65, type: !4)
!80 = !DILocation(line: 65, column: 12, scope: !76)
!81 = !DILocation(line: 65, column: 33, scope: !76)
!82 = !DILocation(line: 66, column: 12, scope: !76)
!83 = !DILocation(line: 66, column: 10, scope: !76)
!84 = !DILocation(line: 67, column: 8, scope: !85)
!85 = distinct !DILexicalBlock(scope: !76, file: !14, line: 67, column: 8)
!86 = !DILocation(line: 67, column: 8, scope: !76)
!87 = !DILocation(line: 70, column: 9, scope: !88)
!88 = distinct !DILexicalBlock(scope: !85, file: !14, line: 68, column: 5)
!89 = !DILocation(line: 71, column: 5, scope: !88)
!90 = !DILocation(line: 75, column: 16, scope: !91)
!91 = distinct !DILexicalBlock(scope: !85, file: !14, line: 73, column: 5)
!92 = !DILocation(line: 75, column: 9, scope: !91)
!93 = !DILocation(line: 76, column: 9, scope: !91)
!94 = !DILocation(line: 76, column: 20, scope: !91)
!95 = !DILocalVariable(name: "dest", scope: !96, file: !14, line: 79, type: !35)
!96 = distinct !DILexicalBlock(scope: !76, file: !14, line: 78, column: 5)
!97 = !DILocation(line: 79, column: 14, scope: !96)
!98 = !DILocation(line: 81, column: 9, scope: !96)
!99 = !DILocation(line: 81, column: 22, scope: !96)
!100 = !DILocation(line: 81, column: 35, scope: !96)
!101 = !DILocation(line: 81, column: 28, scope: !96)
!102 = !DILocation(line: 81, column: 40, scope: !96)
!103 = !DILocation(line: 82, column: 9, scope: !96)
!104 = !DILocation(line: 82, column: 20, scope: !96)
!105 = !DILocation(line: 83, column: 19, scope: !96)
!106 = !DILocation(line: 83, column: 9, scope: !96)
!107 = !DILocation(line: 85, column: 1, scope: !76)
!108 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !14, file: !14, line: 30, type: !73, scopeLine: 31, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!109 = !DILocation(line: 32, column: 5, scope: !108)
!110 = distinct !DISubprogram(name: "goodG2B2", scope: !14, file: !14, line: 88, type: !15, scopeLine: 89, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!111 = !DILocalVariable(name: "data", scope: !110, file: !14, line: 90, type: !4)
!112 = !DILocation(line: 90, column: 12, scope: !110)
!113 = !DILocalVariable(name: "dataBuffer", scope: !110, file: !14, line: 91, type: !4)
!114 = !DILocation(line: 91, column: 12, scope: !110)
!115 = !DILocation(line: 91, column: 33, scope: !110)
!116 = !DILocation(line: 92, column: 12, scope: !110)
!117 = !DILocation(line: 92, column: 10, scope: !110)
!118 = !DILocation(line: 93, column: 8, scope: !119)
!119 = distinct !DILexicalBlock(scope: !110, file: !14, line: 93, column: 8)
!120 = !DILocation(line: 93, column: 8, scope: !110)
!121 = !DILocation(line: 96, column: 16, scope: !122)
!122 = distinct !DILexicalBlock(scope: !119, file: !14, line: 94, column: 5)
!123 = !DILocation(line: 96, column: 9, scope: !122)
!124 = !DILocation(line: 97, column: 9, scope: !122)
!125 = !DILocation(line: 97, column: 20, scope: !122)
!126 = !DILocation(line: 98, column: 5, scope: !122)
!127 = !DILocalVariable(name: "dest", scope: !128, file: !14, line: 100, type: !35)
!128 = distinct !DILexicalBlock(scope: !110, file: !14, line: 99, column: 5)
!129 = !DILocation(line: 100, column: 14, scope: !128)
!130 = !DILocation(line: 102, column: 9, scope: !128)
!131 = !DILocation(line: 102, column: 22, scope: !128)
!132 = !DILocation(line: 102, column: 35, scope: !128)
!133 = !DILocation(line: 102, column: 28, scope: !128)
!134 = !DILocation(line: 102, column: 40, scope: !128)
!135 = !DILocation(line: 103, column: 9, scope: !128)
!136 = !DILocation(line: 103, column: 20, scope: !128)
!137 = !DILocation(line: 104, column: 19, scope: !128)
!138 = !DILocation(line: 104, column: 9, scope: !128)
!139 = !DILocation(line: 106, column: 1, scope: !110)
