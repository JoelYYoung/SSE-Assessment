; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cpy_08.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cpy_08.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cpy_08_bad() #0 !dbg !15 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !21, metadata !DIExpression()), !dbg !22
  %0 = alloca i8, i64 400, align 16, !dbg !23
  %1 = bitcast i8* %0 to i32*, !dbg !24
  store i32* %1, i32** %dataBuffer, align 8, !dbg !22
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !25
  store i32* %2, i32** %data, align 8, !dbg !26
  %call = call i32 @staticReturnsTrue(), !dbg !27
  %tobool = icmp ne i32 %call, 0, !dbg !27
  br i1 %tobool, label %if.then, label %if.end, !dbg !29

if.then:                                          ; preds = %entry
  %3 = load i32*, i32** %data, align 8, !dbg !30
  %call1 = call i32* @wmemset(i32* %3, i32 65, i64 99) #5, !dbg !32
  %4 = load i32*, i32** %data, align 8, !dbg !33
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !33
  store i32 0, i32* %arrayidx, align 4, !dbg !34
  br label %if.end, !dbg !35

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !36, metadata !DIExpression()), !dbg !41
  %5 = bitcast [50 x i32]* %dest to i8*, !dbg !41
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 200, i1 false), !dbg !41
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !42
  %6 = load i32*, i32** %data, align 8, !dbg !43
  %call2 = call i32* @wcscpy(i32* %arraydecay, i32* %6) #5, !dbg !44
  %7 = load i32*, i32** %data, align 8, !dbg !45
  call void @printWLine(i32* %7), !dbg !46
  ret void, !dbg !47
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nounwind
declare dso_local i32* @wcscpy(i32*, i32*) #2

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cpy_08_good() #0 !dbg !48 {
entry:
  call void @goodG2B1(), !dbg !49
  call void @goodG2B2(), !dbg !50
  ret void, !dbg !51
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !52 {
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
  call void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cpy_08_good(), !dbg !66
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !67
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !68
  call void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cpy_08_bad(), !dbg !69
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !70
  ret i32 0, !dbg !71
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !72 {
entry:
  ret i32 1, !dbg !75
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !76 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !77, metadata !DIExpression()), !dbg !78
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !79, metadata !DIExpression()), !dbg !80
  %0 = alloca i8, i64 400, align 16, !dbg !81
  %1 = bitcast i8* %0 to i32*, !dbg !82
  store i32* %1, i32** %dataBuffer, align 8, !dbg !80
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !83
  store i32* %2, i32** %data, align 8, !dbg !84
  %call = call i32 @staticReturnsFalse(), !dbg !85
  %tobool = icmp ne i32 %call, 0, !dbg !85
  br i1 %tobool, label %if.then, label %if.else, !dbg !87

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !88
  br label %if.end, !dbg !90

if.else:                                          ; preds = %entry
  %3 = load i32*, i32** %data, align 8, !dbg !91
  %call1 = call i32* @wmemset(i32* %3, i32 65, i64 49) #5, !dbg !93
  %4 = load i32*, i32** %data, align 8, !dbg !94
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 49, !dbg !94
  store i32 0, i32* %arrayidx, align 4, !dbg !95
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !96, metadata !DIExpression()), !dbg !98
  %5 = bitcast [50 x i32]* %dest to i8*, !dbg !98
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 200, i1 false), !dbg !98
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !99
  %6 = load i32*, i32** %data, align 8, !dbg !100
  %call2 = call i32* @wcscpy(i32* %arraydecay, i32* %6) #5, !dbg !101
  %7 = load i32*, i32** %data, align 8, !dbg !102
  call void @printWLine(i32* %7), !dbg !103
  ret void, !dbg !104
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !105 {
entry:
  ret i32 0, !dbg !106
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !107 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !108, metadata !DIExpression()), !dbg !109
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !110, metadata !DIExpression()), !dbg !111
  %0 = alloca i8, i64 400, align 16, !dbg !112
  %1 = bitcast i8* %0 to i32*, !dbg !113
  store i32* %1, i32** %dataBuffer, align 8, !dbg !111
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !114
  store i32* %2, i32** %data, align 8, !dbg !115
  %call = call i32 @staticReturnsTrue(), !dbg !116
  %tobool = icmp ne i32 %call, 0, !dbg !116
  br i1 %tobool, label %if.then, label %if.end, !dbg !118

if.then:                                          ; preds = %entry
  %3 = load i32*, i32** %data, align 8, !dbg !119
  %call1 = call i32* @wmemset(i32* %3, i32 65, i64 49) #5, !dbg !121
  %4 = load i32*, i32** %data, align 8, !dbg !122
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 49, !dbg !122
  store i32 0, i32* %arrayidx, align 4, !dbg !123
  br label %if.end, !dbg !124

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !125, metadata !DIExpression()), !dbg !127
  %5 = bitcast [50 x i32]* %dest to i8*, !dbg !127
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 200, i1 false), !dbg !127
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !128
  %6 = load i32*, i32** %data, align 8, !dbg !129
  %call2 = call i32* @wcscpy(i32* %arraydecay, i32* %6) #5, !dbg !130
  %7 = load i32*, i32** %data, align 8, !dbg !131
  call void @printWLine(i32* %7), !dbg !132
  ret void, !dbg !133
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cpy_08.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !8}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !6, line: 74, baseType: !7)
!6 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !{i32 7, !"Dwarf Version", i32 4}
!10 = !{i32 2, !"Debug Info Version", i32 3}
!11 = !{i32 1, !"wchar_size", i32 4}
!12 = !{i32 7, !"uwtable", i32 1}
!13 = !{i32 7, !"frame-pointer", i32 2}
!14 = !{!"clang version 13.0.0"}
!15 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cpy_08_bad", scope: !16, file: !16, line: 37, type: !17, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cpy_08.c", directory: "/root/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 39, type: !4)
!20 = !DILocation(line: 39, column: 15, scope: !15)
!21 = !DILocalVariable(name: "dataBuffer", scope: !15, file: !16, line: 40, type: !4)
!22 = !DILocation(line: 40, column: 15, scope: !15)
!23 = !DILocation(line: 40, column: 39, scope: !15)
!24 = !DILocation(line: 40, column: 28, scope: !15)
!25 = !DILocation(line: 41, column: 12, scope: !15)
!26 = !DILocation(line: 41, column: 10, scope: !15)
!27 = !DILocation(line: 42, column: 8, scope: !28)
!28 = distinct !DILexicalBlock(scope: !15, file: !16, line: 42, column: 8)
!29 = !DILocation(line: 42, column: 8, scope: !15)
!30 = !DILocation(line: 45, column: 17, scope: !31)
!31 = distinct !DILexicalBlock(scope: !28, file: !16, line: 43, column: 5)
!32 = !DILocation(line: 45, column: 9, scope: !31)
!33 = !DILocation(line: 46, column: 9, scope: !31)
!34 = !DILocation(line: 46, column: 21, scope: !31)
!35 = !DILocation(line: 47, column: 5, scope: !31)
!36 = !DILocalVariable(name: "dest", scope: !37, file: !16, line: 49, type: !38)
!37 = distinct !DILexicalBlock(scope: !15, file: !16, line: 48, column: 5)
!38 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 1600, elements: !39)
!39 = !{!40}
!40 = !DISubrange(count: 50)
!41 = !DILocation(line: 49, column: 17, scope: !37)
!42 = !DILocation(line: 51, column: 16, scope: !37)
!43 = !DILocation(line: 51, column: 22, scope: !37)
!44 = !DILocation(line: 51, column: 9, scope: !37)
!45 = !DILocation(line: 52, column: 20, scope: !37)
!46 = !DILocation(line: 52, column: 9, scope: !37)
!47 = !DILocation(line: 54, column: 1, scope: !15)
!48 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cpy_08_good", scope: !16, file: !16, line: 105, type: !17, scopeLine: 106, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!49 = !DILocation(line: 107, column: 5, scope: !48)
!50 = !DILocation(line: 108, column: 5, scope: !48)
!51 = !DILocation(line: 109, column: 1, scope: !48)
!52 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 121, type: !53, scopeLine: 122, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!53 = !DISubroutineType(types: !54)
!54 = !{!7, !7, !55}
!55 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !56, size: 64)
!56 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !57, size: 64)
!57 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!58 = !DILocalVariable(name: "argc", arg: 1, scope: !52, file: !16, line: 121, type: !7)
!59 = !DILocation(line: 121, column: 14, scope: !52)
!60 = !DILocalVariable(name: "argv", arg: 2, scope: !52, file: !16, line: 121, type: !55)
!61 = !DILocation(line: 121, column: 27, scope: !52)
!62 = !DILocation(line: 124, column: 22, scope: !52)
!63 = !DILocation(line: 124, column: 12, scope: !52)
!64 = !DILocation(line: 124, column: 5, scope: !52)
!65 = !DILocation(line: 126, column: 5, scope: !52)
!66 = !DILocation(line: 127, column: 5, scope: !52)
!67 = !DILocation(line: 128, column: 5, scope: !52)
!68 = !DILocation(line: 131, column: 5, scope: !52)
!69 = !DILocation(line: 132, column: 5, scope: !52)
!70 = !DILocation(line: 133, column: 5, scope: !52)
!71 = !DILocation(line: 135, column: 5, scope: !52)
!72 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !16, file: !16, line: 25, type: !73, scopeLine: 26, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!73 = !DISubroutineType(types: !74)
!74 = !{!7}
!75 = !DILocation(line: 27, column: 5, scope: !72)
!76 = distinct !DISubprogram(name: "goodG2B1", scope: !16, file: !16, line: 61, type: !17, scopeLine: 62, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!77 = !DILocalVariable(name: "data", scope: !76, file: !16, line: 63, type: !4)
!78 = !DILocation(line: 63, column: 15, scope: !76)
!79 = !DILocalVariable(name: "dataBuffer", scope: !76, file: !16, line: 64, type: !4)
!80 = !DILocation(line: 64, column: 15, scope: !76)
!81 = !DILocation(line: 64, column: 39, scope: !76)
!82 = !DILocation(line: 64, column: 28, scope: !76)
!83 = !DILocation(line: 65, column: 12, scope: !76)
!84 = !DILocation(line: 65, column: 10, scope: !76)
!85 = !DILocation(line: 66, column: 8, scope: !86)
!86 = distinct !DILexicalBlock(scope: !76, file: !16, line: 66, column: 8)
!87 = !DILocation(line: 66, column: 8, scope: !76)
!88 = !DILocation(line: 69, column: 9, scope: !89)
!89 = distinct !DILexicalBlock(scope: !86, file: !16, line: 67, column: 5)
!90 = !DILocation(line: 70, column: 5, scope: !89)
!91 = !DILocation(line: 74, column: 17, scope: !92)
!92 = distinct !DILexicalBlock(scope: !86, file: !16, line: 72, column: 5)
!93 = !DILocation(line: 74, column: 9, scope: !92)
!94 = !DILocation(line: 75, column: 9, scope: !92)
!95 = !DILocation(line: 75, column: 20, scope: !92)
!96 = !DILocalVariable(name: "dest", scope: !97, file: !16, line: 78, type: !38)
!97 = distinct !DILexicalBlock(scope: !76, file: !16, line: 77, column: 5)
!98 = !DILocation(line: 78, column: 17, scope: !97)
!99 = !DILocation(line: 80, column: 16, scope: !97)
!100 = !DILocation(line: 80, column: 22, scope: !97)
!101 = !DILocation(line: 80, column: 9, scope: !97)
!102 = !DILocation(line: 81, column: 20, scope: !97)
!103 = !DILocation(line: 81, column: 9, scope: !97)
!104 = !DILocation(line: 83, column: 1, scope: !76)
!105 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !16, file: !16, line: 30, type: !73, scopeLine: 31, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!106 = !DILocation(line: 32, column: 5, scope: !105)
!107 = distinct !DISubprogram(name: "goodG2B2", scope: !16, file: !16, line: 86, type: !17, scopeLine: 87, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!108 = !DILocalVariable(name: "data", scope: !107, file: !16, line: 88, type: !4)
!109 = !DILocation(line: 88, column: 15, scope: !107)
!110 = !DILocalVariable(name: "dataBuffer", scope: !107, file: !16, line: 89, type: !4)
!111 = !DILocation(line: 89, column: 15, scope: !107)
!112 = !DILocation(line: 89, column: 39, scope: !107)
!113 = !DILocation(line: 89, column: 28, scope: !107)
!114 = !DILocation(line: 90, column: 12, scope: !107)
!115 = !DILocation(line: 90, column: 10, scope: !107)
!116 = !DILocation(line: 91, column: 8, scope: !117)
!117 = distinct !DILexicalBlock(scope: !107, file: !16, line: 91, column: 8)
!118 = !DILocation(line: 91, column: 8, scope: !107)
!119 = !DILocation(line: 94, column: 17, scope: !120)
!120 = distinct !DILexicalBlock(scope: !117, file: !16, line: 92, column: 5)
!121 = !DILocation(line: 94, column: 9, scope: !120)
!122 = !DILocation(line: 95, column: 9, scope: !120)
!123 = !DILocation(line: 95, column: 20, scope: !120)
!124 = !DILocation(line: 96, column: 5, scope: !120)
!125 = !DILocalVariable(name: "dest", scope: !126, file: !16, line: 98, type: !38)
!126 = distinct !DILexicalBlock(scope: !107, file: !16, line: 97, column: 5)
!127 = !DILocation(line: 98, column: 17, scope: !126)
!128 = !DILocation(line: 100, column: 16, scope: !126)
!129 = !DILocation(line: 100, column: 22, scope: !126)
!130 = !DILocation(line: 100, column: 9, scope: !126)
!131 = !DILocation(line: 101, column: 20, scope: !126)
!132 = !DILocation(line: 101, column: 9, scope: !126)
!133 = !DILocation(line: 103, column: 1, scope: !107)
