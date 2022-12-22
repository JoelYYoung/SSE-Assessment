; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_ncpy_08.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_ncpy_08.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_ncpy_08_bad() #0 !dbg !15 {
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
  %call = call i32 @staticReturnsTrue(), !dbg !29
  %tobool = icmp ne i32 %call, 0, !dbg !29
  br i1 %tobool, label %if.then, label %if.end, !dbg !31

if.then:                                          ; preds = %entry
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !32
  store i32* %4, i32** %data, align 8, !dbg !34
  %5 = load i32*, i32** %data, align 8, !dbg !35
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !35
  store i32 0, i32* %arrayidx, align 4, !dbg !36
  br label %if.end, !dbg !37

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !38, metadata !DIExpression()), !dbg !43
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !44
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !45
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !46
  store i32 0, i32* %arrayidx2, align 4, !dbg !47
  %6 = load i32*, i32** %data, align 8, !dbg !48
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !49
  %call4 = call i32* @wcsncpy(i32* %6, i32* %arraydecay3, i64 99) #4, !dbg !50
  %7 = load i32*, i32** %data, align 8, !dbg !51
  %arrayidx5 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !51
  store i32 0, i32* %arrayidx5, align 4, !dbg !52
  %8 = load i32*, i32** %data, align 8, !dbg !53
  call void @printWLine(i32* %8), !dbg !54
  ret void, !dbg !55
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind
declare dso_local i32* @wcsncpy(i32*, i32*, i64) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_ncpy_08_good() #0 !dbg !56 {
entry:
  call void @goodG2B1(), !dbg !57
  call void @goodG2B2(), !dbg !58
  ret void, !dbg !59
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !60 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !66, metadata !DIExpression()), !dbg !67
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !68, metadata !DIExpression()), !dbg !69
  %call = call i64 @time(i64* null) #4, !dbg !70
  %conv = trunc i64 %call to i32, !dbg !71
  call void @srand(i32 %conv) #4, !dbg !72
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !73
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_ncpy_08_good(), !dbg !74
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !75
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !76
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_ncpy_08_bad(), !dbg !77
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !78
  ret i32 0, !dbg !79
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !80 {
entry:
  ret i32 1, !dbg !83
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !84 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !85, metadata !DIExpression()), !dbg !86
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !87, metadata !DIExpression()), !dbg !88
  %0 = alloca i8, i64 200, align 16, !dbg !89
  %1 = bitcast i8* %0 to i32*, !dbg !90
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !88
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !91, metadata !DIExpression()), !dbg !92
  %2 = alloca i8, i64 400, align 16, !dbg !93
  %3 = bitcast i8* %2 to i32*, !dbg !94
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !92
  %call = call i32 @staticReturnsFalse(), !dbg !95
  %tobool = icmp ne i32 %call, 0, !dbg !95
  br i1 %tobool, label %if.then, label %if.else, !dbg !97

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !98
  br label %if.end, !dbg !100

if.else:                                          ; preds = %entry
  %4 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !101
  store i32* %4, i32** %data, align 8, !dbg !103
  %5 = load i32*, i32** %data, align 8, !dbg !104
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !104
  store i32 0, i32* %arrayidx, align 4, !dbg !105
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !106, metadata !DIExpression()), !dbg !108
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !109
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !110
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !111
  store i32 0, i32* %arrayidx2, align 4, !dbg !112
  %6 = load i32*, i32** %data, align 8, !dbg !113
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !114
  %call4 = call i32* @wcsncpy(i32* %6, i32* %arraydecay3, i64 99) #4, !dbg !115
  %7 = load i32*, i32** %data, align 8, !dbg !116
  %arrayidx5 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !116
  store i32 0, i32* %arrayidx5, align 4, !dbg !117
  %8 = load i32*, i32** %data, align 8, !dbg !118
  call void @printWLine(i32* %8), !dbg !119
  ret void, !dbg !120
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !121 {
entry:
  ret i32 0, !dbg !122
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !123 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !124, metadata !DIExpression()), !dbg !125
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !126, metadata !DIExpression()), !dbg !127
  %0 = alloca i8, i64 200, align 16, !dbg !128
  %1 = bitcast i8* %0 to i32*, !dbg !129
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !127
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !130, metadata !DIExpression()), !dbg !131
  %2 = alloca i8, i64 400, align 16, !dbg !132
  %3 = bitcast i8* %2 to i32*, !dbg !133
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !131
  %call = call i32 @staticReturnsTrue(), !dbg !134
  %tobool = icmp ne i32 %call, 0, !dbg !134
  br i1 %tobool, label %if.then, label %if.end, !dbg !136

if.then:                                          ; preds = %entry
  %4 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !137
  store i32* %4, i32** %data, align 8, !dbg !139
  %5 = load i32*, i32** %data, align 8, !dbg !140
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !140
  store i32 0, i32* %arrayidx, align 4, !dbg !141
  br label %if.end, !dbg !142

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !143, metadata !DIExpression()), !dbg !145
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !146
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !147
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !148
  store i32 0, i32* %arrayidx2, align 4, !dbg !149
  %6 = load i32*, i32** %data, align 8, !dbg !150
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !151
  %call4 = call i32* @wcsncpy(i32* %6, i32* %arraydecay3, i64 99) #4, !dbg !152
  %7 = load i32*, i32** %data, align 8, !dbg !153
  %arrayidx5 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !153
  store i32 0, i32* %arrayidx5, align 4, !dbg !154
  %8 = load i32*, i32** %data, align 8, !dbg !155
  call void @printWLine(i32* %8), !dbg !156
  ret void, !dbg !157
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_ncpy_08.c", directory: "/root/SSE-Assessment")
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
!15 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_ncpy_08_bad", scope: !16, file: !16, line: 37, type: !17, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_ncpy_08.c", directory: "/root/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 39, type: !4)
!20 = !DILocation(line: 39, column: 15, scope: !15)
!21 = !DILocalVariable(name: "dataBadBuffer", scope: !15, file: !16, line: 40, type: !4)
!22 = !DILocation(line: 40, column: 15, scope: !15)
!23 = !DILocation(line: 40, column: 42, scope: !15)
!24 = !DILocation(line: 40, column: 31, scope: !15)
!25 = !DILocalVariable(name: "dataGoodBuffer", scope: !15, file: !16, line: 41, type: !4)
!26 = !DILocation(line: 41, column: 15, scope: !15)
!27 = !DILocation(line: 41, column: 43, scope: !15)
!28 = !DILocation(line: 41, column: 32, scope: !15)
!29 = !DILocation(line: 42, column: 8, scope: !30)
!30 = distinct !DILexicalBlock(scope: !15, file: !16, line: 42, column: 8)
!31 = !DILocation(line: 42, column: 8, scope: !15)
!32 = !DILocation(line: 46, column: 16, scope: !33)
!33 = distinct !DILexicalBlock(scope: !30, file: !16, line: 43, column: 5)
!34 = !DILocation(line: 46, column: 14, scope: !33)
!35 = !DILocation(line: 47, column: 9, scope: !33)
!36 = !DILocation(line: 47, column: 17, scope: !33)
!37 = !DILocation(line: 48, column: 5, scope: !33)
!38 = !DILocalVariable(name: "source", scope: !39, file: !16, line: 50, type: !40)
!39 = distinct !DILexicalBlock(scope: !15, file: !16, line: 49, column: 5)
!40 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !41)
!41 = !{!42}
!42 = !DISubrange(count: 100)
!43 = !DILocation(line: 50, column: 17, scope: !39)
!44 = !DILocation(line: 51, column: 17, scope: !39)
!45 = !DILocation(line: 51, column: 9, scope: !39)
!46 = !DILocation(line: 52, column: 9, scope: !39)
!47 = !DILocation(line: 52, column: 23, scope: !39)
!48 = !DILocation(line: 54, column: 17, scope: !39)
!49 = !DILocation(line: 54, column: 23, scope: !39)
!50 = !DILocation(line: 54, column: 9, scope: !39)
!51 = !DILocation(line: 55, column: 9, scope: !39)
!52 = !DILocation(line: 55, column: 21, scope: !39)
!53 = !DILocation(line: 56, column: 20, scope: !39)
!54 = !DILocation(line: 56, column: 9, scope: !39)
!55 = !DILocation(line: 58, column: 1, scope: !15)
!56 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_ncpy_08_good", scope: !16, file: !16, line: 115, type: !17, scopeLine: 116, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!57 = !DILocation(line: 117, column: 5, scope: !56)
!58 = !DILocation(line: 118, column: 5, scope: !56)
!59 = !DILocation(line: 119, column: 1, scope: !56)
!60 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 131, type: !61, scopeLine: 132, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!61 = !DISubroutineType(types: !62)
!62 = !{!7, !7, !63}
!63 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !64, size: 64)
!64 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !65, size: 64)
!65 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!66 = !DILocalVariable(name: "argc", arg: 1, scope: !60, file: !16, line: 131, type: !7)
!67 = !DILocation(line: 131, column: 14, scope: !60)
!68 = !DILocalVariable(name: "argv", arg: 2, scope: !60, file: !16, line: 131, type: !63)
!69 = !DILocation(line: 131, column: 27, scope: !60)
!70 = !DILocation(line: 134, column: 22, scope: !60)
!71 = !DILocation(line: 134, column: 12, scope: !60)
!72 = !DILocation(line: 134, column: 5, scope: !60)
!73 = !DILocation(line: 136, column: 5, scope: !60)
!74 = !DILocation(line: 137, column: 5, scope: !60)
!75 = !DILocation(line: 138, column: 5, scope: !60)
!76 = !DILocation(line: 141, column: 5, scope: !60)
!77 = !DILocation(line: 142, column: 5, scope: !60)
!78 = !DILocation(line: 143, column: 5, scope: !60)
!79 = !DILocation(line: 145, column: 5, scope: !60)
!80 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !16, file: !16, line: 25, type: !81, scopeLine: 26, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!81 = !DISubroutineType(types: !82)
!82 = !{!7}
!83 = !DILocation(line: 27, column: 5, scope: !80)
!84 = distinct !DISubprogram(name: "goodG2B1", scope: !16, file: !16, line: 65, type: !17, scopeLine: 66, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!85 = !DILocalVariable(name: "data", scope: !84, file: !16, line: 67, type: !4)
!86 = !DILocation(line: 67, column: 15, scope: !84)
!87 = !DILocalVariable(name: "dataBadBuffer", scope: !84, file: !16, line: 68, type: !4)
!88 = !DILocation(line: 68, column: 15, scope: !84)
!89 = !DILocation(line: 68, column: 42, scope: !84)
!90 = !DILocation(line: 68, column: 31, scope: !84)
!91 = !DILocalVariable(name: "dataGoodBuffer", scope: !84, file: !16, line: 69, type: !4)
!92 = !DILocation(line: 69, column: 15, scope: !84)
!93 = !DILocation(line: 69, column: 43, scope: !84)
!94 = !DILocation(line: 69, column: 32, scope: !84)
!95 = !DILocation(line: 70, column: 8, scope: !96)
!96 = distinct !DILexicalBlock(scope: !84, file: !16, line: 70, column: 8)
!97 = !DILocation(line: 70, column: 8, scope: !84)
!98 = !DILocation(line: 73, column: 9, scope: !99)
!99 = distinct !DILexicalBlock(scope: !96, file: !16, line: 71, column: 5)
!100 = !DILocation(line: 74, column: 5, scope: !99)
!101 = !DILocation(line: 78, column: 16, scope: !102)
!102 = distinct !DILexicalBlock(scope: !96, file: !16, line: 76, column: 5)
!103 = !DILocation(line: 78, column: 14, scope: !102)
!104 = !DILocation(line: 79, column: 9, scope: !102)
!105 = !DILocation(line: 79, column: 17, scope: !102)
!106 = !DILocalVariable(name: "source", scope: !107, file: !16, line: 82, type: !40)
!107 = distinct !DILexicalBlock(scope: !84, file: !16, line: 81, column: 5)
!108 = !DILocation(line: 82, column: 17, scope: !107)
!109 = !DILocation(line: 83, column: 17, scope: !107)
!110 = !DILocation(line: 83, column: 9, scope: !107)
!111 = !DILocation(line: 84, column: 9, scope: !107)
!112 = !DILocation(line: 84, column: 23, scope: !107)
!113 = !DILocation(line: 86, column: 17, scope: !107)
!114 = !DILocation(line: 86, column: 23, scope: !107)
!115 = !DILocation(line: 86, column: 9, scope: !107)
!116 = !DILocation(line: 87, column: 9, scope: !107)
!117 = !DILocation(line: 87, column: 21, scope: !107)
!118 = !DILocation(line: 88, column: 20, scope: !107)
!119 = !DILocation(line: 88, column: 9, scope: !107)
!120 = !DILocation(line: 90, column: 1, scope: !84)
!121 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !16, file: !16, line: 30, type: !81, scopeLine: 31, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!122 = !DILocation(line: 32, column: 5, scope: !121)
!123 = distinct !DISubprogram(name: "goodG2B2", scope: !16, file: !16, line: 93, type: !17, scopeLine: 94, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!124 = !DILocalVariable(name: "data", scope: !123, file: !16, line: 95, type: !4)
!125 = !DILocation(line: 95, column: 15, scope: !123)
!126 = !DILocalVariable(name: "dataBadBuffer", scope: !123, file: !16, line: 96, type: !4)
!127 = !DILocation(line: 96, column: 15, scope: !123)
!128 = !DILocation(line: 96, column: 42, scope: !123)
!129 = !DILocation(line: 96, column: 31, scope: !123)
!130 = !DILocalVariable(name: "dataGoodBuffer", scope: !123, file: !16, line: 97, type: !4)
!131 = !DILocation(line: 97, column: 15, scope: !123)
!132 = !DILocation(line: 97, column: 43, scope: !123)
!133 = !DILocation(line: 97, column: 32, scope: !123)
!134 = !DILocation(line: 98, column: 8, scope: !135)
!135 = distinct !DILexicalBlock(scope: !123, file: !16, line: 98, column: 8)
!136 = !DILocation(line: 98, column: 8, scope: !123)
!137 = !DILocation(line: 101, column: 16, scope: !138)
!138 = distinct !DILexicalBlock(scope: !135, file: !16, line: 99, column: 5)
!139 = !DILocation(line: 101, column: 14, scope: !138)
!140 = !DILocation(line: 102, column: 9, scope: !138)
!141 = !DILocation(line: 102, column: 17, scope: !138)
!142 = !DILocation(line: 103, column: 5, scope: !138)
!143 = !DILocalVariable(name: "source", scope: !144, file: !16, line: 105, type: !40)
!144 = distinct !DILexicalBlock(scope: !123, file: !16, line: 104, column: 5)
!145 = !DILocation(line: 105, column: 17, scope: !144)
!146 = !DILocation(line: 106, column: 17, scope: !144)
!147 = !DILocation(line: 106, column: 9, scope: !144)
!148 = !DILocation(line: 107, column: 9, scope: !144)
!149 = !DILocation(line: 107, column: 23, scope: !144)
!150 = !DILocation(line: 109, column: 17, scope: !144)
!151 = !DILocation(line: 109, column: 23, scope: !144)
!152 = !DILocation(line: 109, column: 9, scope: !144)
!153 = !DILocation(line: 110, column: 9, scope: !144)
!154 = !DILocation(line: 110, column: 21, scope: !144)
!155 = !DILocation(line: 111, column: 20, scope: !144)
!156 = !DILocation(line: 111, column: 9, scope: !144)
!157 = !DILocation(line: 113, column: 1, scope: !123)
