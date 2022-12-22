; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cat_10.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cat_10.c"
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
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cat_10_bad() #0 !dbg !15 {
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
  %3 = load i32, i32* @globalTrue, align 4, !dbg !27
  %tobool = icmp ne i32 %3, 0, !dbg !27
  br i1 %tobool, label %if.then, label %if.end, !dbg !29

if.then:                                          ; preds = %entry
  %4 = load i32*, i32** %data, align 8, !dbg !30
  %call = call i32* @wmemset(i32* %4, i32 65, i64 99) #5, !dbg !32
  %5 = load i32*, i32** %data, align 8, !dbg !33
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 99, !dbg !33
  store i32 0, i32* %arrayidx, align 4, !dbg !34
  br label %if.end, !dbg !35

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !36, metadata !DIExpression()), !dbg !41
  %6 = bitcast [50 x i32]* %dest to i8*, !dbg !41
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 200, i1 false), !dbg !41
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !42
  %7 = load i32*, i32** %data, align 8, !dbg !43
  %call1 = call i32* @wcscat(i32* %arraydecay, i32* %7) #5, !dbg !44
  %8 = load i32*, i32** %data, align 8, !dbg !45
  call void @printWLine(i32* %8), !dbg !46
  ret void, !dbg !47
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nounwind
declare dso_local i32* @wcscat(i32*, i32*) #2

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cat_10_good() #0 !dbg !48 {
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
  call void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cat_10_good(), !dbg !66
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !67
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !68
  call void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cat_10_bad(), !dbg !69
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !70
  ret i32 0, !dbg !71
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !72 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !73, metadata !DIExpression()), !dbg !74
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !75, metadata !DIExpression()), !dbg !76
  %0 = alloca i8, i64 400, align 16, !dbg !77
  %1 = bitcast i8* %0 to i32*, !dbg !78
  store i32* %1, i32** %dataBuffer, align 8, !dbg !76
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !79
  store i32* %2, i32** %data, align 8, !dbg !80
  %3 = load i32, i32* @globalFalse, align 4, !dbg !81
  %tobool = icmp ne i32 %3, 0, !dbg !81
  br i1 %tobool, label %if.then, label %if.else, !dbg !83

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !84
  br label %if.end, !dbg !86

if.else:                                          ; preds = %entry
  %4 = load i32*, i32** %data, align 8, !dbg !87
  %call = call i32* @wmemset(i32* %4, i32 65, i64 49) #5, !dbg !89
  %5 = load i32*, i32** %data, align 8, !dbg !90
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 49, !dbg !90
  store i32 0, i32* %arrayidx, align 4, !dbg !91
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !92, metadata !DIExpression()), !dbg !94
  %6 = bitcast [50 x i32]* %dest to i8*, !dbg !94
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 200, i1 false), !dbg !94
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !95
  %7 = load i32*, i32** %data, align 8, !dbg !96
  %call1 = call i32* @wcscat(i32* %arraydecay, i32* %7) #5, !dbg !97
  %8 = load i32*, i32** %data, align 8, !dbg !98
  call void @printWLine(i32* %8), !dbg !99
  ret void, !dbg !100
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !101 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !102, metadata !DIExpression()), !dbg !103
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !104, metadata !DIExpression()), !dbg !105
  %0 = alloca i8, i64 400, align 16, !dbg !106
  %1 = bitcast i8* %0 to i32*, !dbg !107
  store i32* %1, i32** %dataBuffer, align 8, !dbg !105
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !108
  store i32* %2, i32** %data, align 8, !dbg !109
  %3 = load i32, i32* @globalTrue, align 4, !dbg !110
  %tobool = icmp ne i32 %3, 0, !dbg !110
  br i1 %tobool, label %if.then, label %if.end, !dbg !112

if.then:                                          ; preds = %entry
  %4 = load i32*, i32** %data, align 8, !dbg !113
  %call = call i32* @wmemset(i32* %4, i32 65, i64 49) #5, !dbg !115
  %5 = load i32*, i32** %data, align 8, !dbg !116
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 49, !dbg !116
  store i32 0, i32* %arrayidx, align 4, !dbg !117
  br label %if.end, !dbg !118

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !119, metadata !DIExpression()), !dbg !121
  %6 = bitcast [50 x i32]* %dest to i8*, !dbg !121
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 200, i1 false), !dbg !121
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !122
  %7 = load i32*, i32** %data, align 8, !dbg !123
  %call1 = call i32* @wcscat(i32* %arraydecay, i32* %7) #5, !dbg !124
  %8 = load i32*, i32** %data, align 8, !dbg !125
  call void @printWLine(i32* %8), !dbg !126
  ret void, !dbg !127
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cat_10.c", directory: "/root/SSE-Assessment")
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
!15 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cat_10_bad", scope: !16, file: !16, line: 23, type: !17, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cat_10.c", directory: "/root/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 25, type: !4)
!20 = !DILocation(line: 25, column: 15, scope: !15)
!21 = !DILocalVariable(name: "dataBuffer", scope: !15, file: !16, line: 26, type: !4)
!22 = !DILocation(line: 26, column: 15, scope: !15)
!23 = !DILocation(line: 26, column: 39, scope: !15)
!24 = !DILocation(line: 26, column: 28, scope: !15)
!25 = !DILocation(line: 27, column: 12, scope: !15)
!26 = !DILocation(line: 27, column: 10, scope: !15)
!27 = !DILocation(line: 28, column: 8, scope: !28)
!28 = distinct !DILexicalBlock(scope: !15, file: !16, line: 28, column: 8)
!29 = !DILocation(line: 28, column: 8, scope: !15)
!30 = !DILocation(line: 31, column: 17, scope: !31)
!31 = distinct !DILexicalBlock(scope: !28, file: !16, line: 29, column: 5)
!32 = !DILocation(line: 31, column: 9, scope: !31)
!33 = !DILocation(line: 32, column: 9, scope: !31)
!34 = !DILocation(line: 32, column: 21, scope: !31)
!35 = !DILocation(line: 33, column: 5, scope: !31)
!36 = !DILocalVariable(name: "dest", scope: !37, file: !16, line: 35, type: !38)
!37 = distinct !DILexicalBlock(scope: !15, file: !16, line: 34, column: 5)
!38 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 1600, elements: !39)
!39 = !{!40}
!40 = !DISubrange(count: 50)
!41 = !DILocation(line: 35, column: 17, scope: !37)
!42 = !DILocation(line: 37, column: 16, scope: !37)
!43 = !DILocation(line: 37, column: 22, scope: !37)
!44 = !DILocation(line: 37, column: 9, scope: !37)
!45 = !DILocation(line: 38, column: 20, scope: !37)
!46 = !DILocation(line: 38, column: 9, scope: !37)
!47 = !DILocation(line: 40, column: 1, scope: !15)
!48 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cat_10_good", scope: !16, file: !16, line: 91, type: !17, scopeLine: 92, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!49 = !DILocation(line: 93, column: 5, scope: !48)
!50 = !DILocation(line: 94, column: 5, scope: !48)
!51 = !DILocation(line: 95, column: 1, scope: !48)
!52 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 107, type: !53, scopeLine: 108, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!53 = !DISubroutineType(types: !54)
!54 = !{!7, !7, !55}
!55 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !56, size: 64)
!56 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !57, size: 64)
!57 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!58 = !DILocalVariable(name: "argc", arg: 1, scope: !52, file: !16, line: 107, type: !7)
!59 = !DILocation(line: 107, column: 14, scope: !52)
!60 = !DILocalVariable(name: "argv", arg: 2, scope: !52, file: !16, line: 107, type: !55)
!61 = !DILocation(line: 107, column: 27, scope: !52)
!62 = !DILocation(line: 110, column: 22, scope: !52)
!63 = !DILocation(line: 110, column: 12, scope: !52)
!64 = !DILocation(line: 110, column: 5, scope: !52)
!65 = !DILocation(line: 112, column: 5, scope: !52)
!66 = !DILocation(line: 113, column: 5, scope: !52)
!67 = !DILocation(line: 114, column: 5, scope: !52)
!68 = !DILocation(line: 117, column: 5, scope: !52)
!69 = !DILocation(line: 118, column: 5, scope: !52)
!70 = !DILocation(line: 119, column: 5, scope: !52)
!71 = !DILocation(line: 121, column: 5, scope: !52)
!72 = distinct !DISubprogram(name: "goodG2B1", scope: !16, file: !16, line: 47, type: !17, scopeLine: 48, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!73 = !DILocalVariable(name: "data", scope: !72, file: !16, line: 49, type: !4)
!74 = !DILocation(line: 49, column: 15, scope: !72)
!75 = !DILocalVariable(name: "dataBuffer", scope: !72, file: !16, line: 50, type: !4)
!76 = !DILocation(line: 50, column: 15, scope: !72)
!77 = !DILocation(line: 50, column: 39, scope: !72)
!78 = !DILocation(line: 50, column: 28, scope: !72)
!79 = !DILocation(line: 51, column: 12, scope: !72)
!80 = !DILocation(line: 51, column: 10, scope: !72)
!81 = !DILocation(line: 52, column: 8, scope: !82)
!82 = distinct !DILexicalBlock(scope: !72, file: !16, line: 52, column: 8)
!83 = !DILocation(line: 52, column: 8, scope: !72)
!84 = !DILocation(line: 55, column: 9, scope: !85)
!85 = distinct !DILexicalBlock(scope: !82, file: !16, line: 53, column: 5)
!86 = !DILocation(line: 56, column: 5, scope: !85)
!87 = !DILocation(line: 60, column: 17, scope: !88)
!88 = distinct !DILexicalBlock(scope: !82, file: !16, line: 58, column: 5)
!89 = !DILocation(line: 60, column: 9, scope: !88)
!90 = !DILocation(line: 61, column: 9, scope: !88)
!91 = !DILocation(line: 61, column: 20, scope: !88)
!92 = !DILocalVariable(name: "dest", scope: !93, file: !16, line: 64, type: !38)
!93 = distinct !DILexicalBlock(scope: !72, file: !16, line: 63, column: 5)
!94 = !DILocation(line: 64, column: 17, scope: !93)
!95 = !DILocation(line: 66, column: 16, scope: !93)
!96 = !DILocation(line: 66, column: 22, scope: !93)
!97 = !DILocation(line: 66, column: 9, scope: !93)
!98 = !DILocation(line: 67, column: 20, scope: !93)
!99 = !DILocation(line: 67, column: 9, scope: !93)
!100 = !DILocation(line: 69, column: 1, scope: !72)
!101 = distinct !DISubprogram(name: "goodG2B2", scope: !16, file: !16, line: 72, type: !17, scopeLine: 73, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!102 = !DILocalVariable(name: "data", scope: !101, file: !16, line: 74, type: !4)
!103 = !DILocation(line: 74, column: 15, scope: !101)
!104 = !DILocalVariable(name: "dataBuffer", scope: !101, file: !16, line: 75, type: !4)
!105 = !DILocation(line: 75, column: 15, scope: !101)
!106 = !DILocation(line: 75, column: 39, scope: !101)
!107 = !DILocation(line: 75, column: 28, scope: !101)
!108 = !DILocation(line: 76, column: 12, scope: !101)
!109 = !DILocation(line: 76, column: 10, scope: !101)
!110 = !DILocation(line: 77, column: 8, scope: !111)
!111 = distinct !DILexicalBlock(scope: !101, file: !16, line: 77, column: 8)
!112 = !DILocation(line: 77, column: 8, scope: !101)
!113 = !DILocation(line: 80, column: 17, scope: !114)
!114 = distinct !DILexicalBlock(scope: !111, file: !16, line: 78, column: 5)
!115 = !DILocation(line: 80, column: 9, scope: !114)
!116 = !DILocation(line: 81, column: 9, scope: !114)
!117 = !DILocation(line: 81, column: 20, scope: !114)
!118 = !DILocation(line: 82, column: 5, scope: !114)
!119 = !DILocalVariable(name: "dest", scope: !120, file: !16, line: 84, type: !38)
!120 = distinct !DILexicalBlock(scope: !101, file: !16, line: 83, column: 5)
!121 = !DILocation(line: 84, column: 17, scope: !120)
!122 = !DILocation(line: 86, column: 16, scope: !120)
!123 = !DILocation(line: 86, column: 22, scope: !120)
!124 = !DILocation(line: 86, column: 9, scope: !120)
!125 = !DILocation(line: 87, column: 20, scope: !120)
!126 = !DILocation(line: 87, column: 9, scope: !120)
!127 = !DILocation(line: 89, column: 1, scope: !101)
