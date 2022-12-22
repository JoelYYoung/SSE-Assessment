; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_ncpy_14.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_ncpy_14.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@globalFive = external dso_local global i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_ncpy_14_bad() #0 !dbg !15 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !21, metadata !DIExpression()), !dbg !22
  %0 = alloca i8, i64 200, align 16, !dbg !23
  %1 = bitcast i8* %0 to i32*, !dbg !24
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !22
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !25, metadata !DIExpression()), !dbg !26
  %2 = alloca i8, i64 400, align 16, !dbg !27
  %3 = bitcast i8* %2 to i32*, !dbg !28
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !26
  %4 = load i32, i32* @globalFive, align 4, !dbg !29
  %cmp = icmp eq i32 %4, 5, !dbg !31
  br i1 %cmp, label %if.then, label %if.end, !dbg !32

if.then:                                          ; preds = %entry
  %5 = load i32*, i32** %dataBadBuffer, align 8, !dbg !33
  store i32* %5, i32** %data, align 8, !dbg !35
  %6 = load i32*, i32** %data, align 8, !dbg !36
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 0, !dbg !36
  store i32 0, i32* %arrayidx, align 4, !dbg !37
  br label %if.end, !dbg !38

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !39, metadata !DIExpression()), !dbg !44
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !45
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !46
  %arrayidx1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !47
  store i32 0, i32* %arrayidx1, align 4, !dbg !48
  %7 = load i32*, i32** %data, align 8, !dbg !49
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !50
  %call3 = call i32* @wcsncpy(i32* %7, i32* %arraydecay2, i64 99) #4, !dbg !51
  %8 = load i32*, i32** %data, align 8, !dbg !52
  %arrayidx4 = getelementptr inbounds i32, i32* %8, i64 99, !dbg !52
  store i32 0, i32* %arrayidx4, align 4, !dbg !53
  %9 = load i32*, i32** %data, align 8, !dbg !54
  call void @printWLine(i32* %9), !dbg !55
  ret void, !dbg !56
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind
declare dso_local i32* @wcsncpy(i32*, i32*, i64) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_ncpy_14_good() #0 !dbg !57 {
entry:
  call void @goodG2B1(), !dbg !58
  call void @goodG2B2(), !dbg !59
  ret void, !dbg !60
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !61 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !67, metadata !DIExpression()), !dbg !68
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !69, metadata !DIExpression()), !dbg !70
  %call = call i64 @time(i64* null) #4, !dbg !71
  %conv = trunc i64 %call to i32, !dbg !72
  call void @srand(i32 %conv) #4, !dbg !73
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !74
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_ncpy_14_good(), !dbg !75
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !76
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !77
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_ncpy_14_bad(), !dbg !78
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !79
  ret i32 0, !dbg !80
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !81 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !82, metadata !DIExpression()), !dbg !83
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !84, metadata !DIExpression()), !dbg !85
  %0 = alloca i8, i64 200, align 16, !dbg !86
  %1 = bitcast i8* %0 to i32*, !dbg !87
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !85
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !88, metadata !DIExpression()), !dbg !89
  %2 = alloca i8, i64 400, align 16, !dbg !90
  %3 = bitcast i8* %2 to i32*, !dbg !91
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !89
  %4 = load i32, i32* @globalFive, align 4, !dbg !92
  %cmp = icmp ne i32 %4, 5, !dbg !94
  br i1 %cmp, label %if.then, label %if.else, !dbg !95

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !96
  br label %if.end, !dbg !98

if.else:                                          ; preds = %entry
  %5 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !99
  store i32* %5, i32** %data, align 8, !dbg !101
  %6 = load i32*, i32** %data, align 8, !dbg !102
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 0, !dbg !102
  store i32 0, i32* %arrayidx, align 4, !dbg !103
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !104, metadata !DIExpression()), !dbg !106
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !107
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !108
  %arrayidx1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !109
  store i32 0, i32* %arrayidx1, align 4, !dbg !110
  %7 = load i32*, i32** %data, align 8, !dbg !111
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !112
  %call3 = call i32* @wcsncpy(i32* %7, i32* %arraydecay2, i64 99) #4, !dbg !113
  %8 = load i32*, i32** %data, align 8, !dbg !114
  %arrayidx4 = getelementptr inbounds i32, i32* %8, i64 99, !dbg !114
  store i32 0, i32* %arrayidx4, align 4, !dbg !115
  %9 = load i32*, i32** %data, align 8, !dbg !116
  call void @printWLine(i32* %9), !dbg !117
  ret void, !dbg !118
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !119 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !120, metadata !DIExpression()), !dbg !121
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !122, metadata !DIExpression()), !dbg !123
  %0 = alloca i8, i64 200, align 16, !dbg !124
  %1 = bitcast i8* %0 to i32*, !dbg !125
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !123
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !126, metadata !DIExpression()), !dbg !127
  %2 = alloca i8, i64 400, align 16, !dbg !128
  %3 = bitcast i8* %2 to i32*, !dbg !129
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !127
  %4 = load i32, i32* @globalFive, align 4, !dbg !130
  %cmp = icmp eq i32 %4, 5, !dbg !132
  br i1 %cmp, label %if.then, label %if.end, !dbg !133

if.then:                                          ; preds = %entry
  %5 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !134
  store i32* %5, i32** %data, align 8, !dbg !136
  %6 = load i32*, i32** %data, align 8, !dbg !137
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 0, !dbg !137
  store i32 0, i32* %arrayidx, align 4, !dbg !138
  br label %if.end, !dbg !139

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !140, metadata !DIExpression()), !dbg !142
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !143
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !144
  %arrayidx1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !145
  store i32 0, i32* %arrayidx1, align 4, !dbg !146
  %7 = load i32*, i32** %data, align 8, !dbg !147
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !148
  %call3 = call i32* @wcsncpy(i32* %7, i32* %arraydecay2, i64 99) #4, !dbg !149
  %8 = load i32*, i32** %data, align 8, !dbg !150
  %arrayidx4 = getelementptr inbounds i32, i32* %8, i64 99, !dbg !150
  store i32 0, i32* %arrayidx4, align 4, !dbg !151
  %9 = load i32*, i32** %data, align 8, !dbg !152
  call void @printWLine(i32* %9), !dbg !153
  ret void, !dbg !154
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_ncpy_14.c", directory: "/root/SSE-Assessment")
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
!15 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_ncpy_14_bad", scope: !16, file: !16, line: 23, type: !17, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_ncpy_14.c", directory: "/root/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 25, type: !4)
!20 = !DILocation(line: 25, column: 15, scope: !15)
!21 = !DILocalVariable(name: "dataBadBuffer", scope: !15, file: !16, line: 26, type: !4)
!22 = !DILocation(line: 26, column: 15, scope: !15)
!23 = !DILocation(line: 26, column: 42, scope: !15)
!24 = !DILocation(line: 26, column: 31, scope: !15)
!25 = !DILocalVariable(name: "dataGoodBuffer", scope: !15, file: !16, line: 27, type: !4)
!26 = !DILocation(line: 27, column: 15, scope: !15)
!27 = !DILocation(line: 27, column: 43, scope: !15)
!28 = !DILocation(line: 27, column: 32, scope: !15)
!29 = !DILocation(line: 28, column: 8, scope: !30)
!30 = distinct !DILexicalBlock(scope: !15, file: !16, line: 28, column: 8)
!31 = !DILocation(line: 28, column: 18, scope: !30)
!32 = !DILocation(line: 28, column: 8, scope: !15)
!33 = !DILocation(line: 32, column: 16, scope: !34)
!34 = distinct !DILexicalBlock(scope: !30, file: !16, line: 29, column: 5)
!35 = !DILocation(line: 32, column: 14, scope: !34)
!36 = !DILocation(line: 33, column: 9, scope: !34)
!37 = !DILocation(line: 33, column: 17, scope: !34)
!38 = !DILocation(line: 34, column: 5, scope: !34)
!39 = !DILocalVariable(name: "source", scope: !40, file: !16, line: 36, type: !41)
!40 = distinct !DILexicalBlock(scope: !15, file: !16, line: 35, column: 5)
!41 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !42)
!42 = !{!43}
!43 = !DISubrange(count: 100)
!44 = !DILocation(line: 36, column: 17, scope: !40)
!45 = !DILocation(line: 37, column: 17, scope: !40)
!46 = !DILocation(line: 37, column: 9, scope: !40)
!47 = !DILocation(line: 38, column: 9, scope: !40)
!48 = !DILocation(line: 38, column: 23, scope: !40)
!49 = !DILocation(line: 40, column: 17, scope: !40)
!50 = !DILocation(line: 40, column: 23, scope: !40)
!51 = !DILocation(line: 40, column: 9, scope: !40)
!52 = !DILocation(line: 41, column: 9, scope: !40)
!53 = !DILocation(line: 41, column: 21, scope: !40)
!54 = !DILocation(line: 42, column: 20, scope: !40)
!55 = !DILocation(line: 42, column: 9, scope: !40)
!56 = !DILocation(line: 44, column: 1, scope: !15)
!57 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_ncpy_14_good", scope: !16, file: !16, line: 101, type: !17, scopeLine: 102, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!58 = !DILocation(line: 103, column: 5, scope: !57)
!59 = !DILocation(line: 104, column: 5, scope: !57)
!60 = !DILocation(line: 105, column: 1, scope: !57)
!61 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 117, type: !62, scopeLine: 118, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!62 = !DISubroutineType(types: !63)
!63 = !{!7, !7, !64}
!64 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !65, size: 64)
!65 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !66, size: 64)
!66 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!67 = !DILocalVariable(name: "argc", arg: 1, scope: !61, file: !16, line: 117, type: !7)
!68 = !DILocation(line: 117, column: 14, scope: !61)
!69 = !DILocalVariable(name: "argv", arg: 2, scope: !61, file: !16, line: 117, type: !64)
!70 = !DILocation(line: 117, column: 27, scope: !61)
!71 = !DILocation(line: 120, column: 22, scope: !61)
!72 = !DILocation(line: 120, column: 12, scope: !61)
!73 = !DILocation(line: 120, column: 5, scope: !61)
!74 = !DILocation(line: 122, column: 5, scope: !61)
!75 = !DILocation(line: 123, column: 5, scope: !61)
!76 = !DILocation(line: 124, column: 5, scope: !61)
!77 = !DILocation(line: 127, column: 5, scope: !61)
!78 = !DILocation(line: 128, column: 5, scope: !61)
!79 = !DILocation(line: 129, column: 5, scope: !61)
!80 = !DILocation(line: 131, column: 5, scope: !61)
!81 = distinct !DISubprogram(name: "goodG2B1", scope: !16, file: !16, line: 51, type: !17, scopeLine: 52, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!82 = !DILocalVariable(name: "data", scope: !81, file: !16, line: 53, type: !4)
!83 = !DILocation(line: 53, column: 15, scope: !81)
!84 = !DILocalVariable(name: "dataBadBuffer", scope: !81, file: !16, line: 54, type: !4)
!85 = !DILocation(line: 54, column: 15, scope: !81)
!86 = !DILocation(line: 54, column: 42, scope: !81)
!87 = !DILocation(line: 54, column: 31, scope: !81)
!88 = !DILocalVariable(name: "dataGoodBuffer", scope: !81, file: !16, line: 55, type: !4)
!89 = !DILocation(line: 55, column: 15, scope: !81)
!90 = !DILocation(line: 55, column: 43, scope: !81)
!91 = !DILocation(line: 55, column: 32, scope: !81)
!92 = !DILocation(line: 56, column: 8, scope: !93)
!93 = distinct !DILexicalBlock(scope: !81, file: !16, line: 56, column: 8)
!94 = !DILocation(line: 56, column: 18, scope: !93)
!95 = !DILocation(line: 56, column: 8, scope: !81)
!96 = !DILocation(line: 59, column: 9, scope: !97)
!97 = distinct !DILexicalBlock(scope: !93, file: !16, line: 57, column: 5)
!98 = !DILocation(line: 60, column: 5, scope: !97)
!99 = !DILocation(line: 64, column: 16, scope: !100)
!100 = distinct !DILexicalBlock(scope: !93, file: !16, line: 62, column: 5)
!101 = !DILocation(line: 64, column: 14, scope: !100)
!102 = !DILocation(line: 65, column: 9, scope: !100)
!103 = !DILocation(line: 65, column: 17, scope: !100)
!104 = !DILocalVariable(name: "source", scope: !105, file: !16, line: 68, type: !41)
!105 = distinct !DILexicalBlock(scope: !81, file: !16, line: 67, column: 5)
!106 = !DILocation(line: 68, column: 17, scope: !105)
!107 = !DILocation(line: 69, column: 17, scope: !105)
!108 = !DILocation(line: 69, column: 9, scope: !105)
!109 = !DILocation(line: 70, column: 9, scope: !105)
!110 = !DILocation(line: 70, column: 23, scope: !105)
!111 = !DILocation(line: 72, column: 17, scope: !105)
!112 = !DILocation(line: 72, column: 23, scope: !105)
!113 = !DILocation(line: 72, column: 9, scope: !105)
!114 = !DILocation(line: 73, column: 9, scope: !105)
!115 = !DILocation(line: 73, column: 21, scope: !105)
!116 = !DILocation(line: 74, column: 20, scope: !105)
!117 = !DILocation(line: 74, column: 9, scope: !105)
!118 = !DILocation(line: 76, column: 1, scope: !81)
!119 = distinct !DISubprogram(name: "goodG2B2", scope: !16, file: !16, line: 79, type: !17, scopeLine: 80, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!120 = !DILocalVariable(name: "data", scope: !119, file: !16, line: 81, type: !4)
!121 = !DILocation(line: 81, column: 15, scope: !119)
!122 = !DILocalVariable(name: "dataBadBuffer", scope: !119, file: !16, line: 82, type: !4)
!123 = !DILocation(line: 82, column: 15, scope: !119)
!124 = !DILocation(line: 82, column: 42, scope: !119)
!125 = !DILocation(line: 82, column: 31, scope: !119)
!126 = !DILocalVariable(name: "dataGoodBuffer", scope: !119, file: !16, line: 83, type: !4)
!127 = !DILocation(line: 83, column: 15, scope: !119)
!128 = !DILocation(line: 83, column: 43, scope: !119)
!129 = !DILocation(line: 83, column: 32, scope: !119)
!130 = !DILocation(line: 84, column: 8, scope: !131)
!131 = distinct !DILexicalBlock(scope: !119, file: !16, line: 84, column: 8)
!132 = !DILocation(line: 84, column: 18, scope: !131)
!133 = !DILocation(line: 84, column: 8, scope: !119)
!134 = !DILocation(line: 87, column: 16, scope: !135)
!135 = distinct !DILexicalBlock(scope: !131, file: !16, line: 85, column: 5)
!136 = !DILocation(line: 87, column: 14, scope: !135)
!137 = !DILocation(line: 88, column: 9, scope: !135)
!138 = !DILocation(line: 88, column: 17, scope: !135)
!139 = !DILocation(line: 89, column: 5, scope: !135)
!140 = !DILocalVariable(name: "source", scope: !141, file: !16, line: 91, type: !41)
!141 = distinct !DILexicalBlock(scope: !119, file: !16, line: 90, column: 5)
!142 = !DILocation(line: 91, column: 17, scope: !141)
!143 = !DILocation(line: 92, column: 17, scope: !141)
!144 = !DILocation(line: 92, column: 9, scope: !141)
!145 = !DILocation(line: 93, column: 9, scope: !141)
!146 = !DILocation(line: 93, column: 23, scope: !141)
!147 = !DILocation(line: 95, column: 17, scope: !141)
!148 = !DILocation(line: 95, column: 23, scope: !141)
!149 = !DILocation(line: 95, column: 9, scope: !141)
!150 = !DILocation(line: 96, column: 9, scope: !141)
!151 = !DILocation(line: 96, column: 21, scope: !141)
!152 = !DILocation(line: 97, column: 20, scope: !141)
!153 = !DILocation(line: 97, column: 9, scope: !141)
!154 = !DILocation(line: 99, column: 1, scope: !119)
