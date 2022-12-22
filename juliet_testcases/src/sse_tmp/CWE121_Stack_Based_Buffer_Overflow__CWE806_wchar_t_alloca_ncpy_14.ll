; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_ncpy_14.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_ncpy_14.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@globalFive = external dso_local global i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_ncpy_14_bad() #0 !dbg !15 {
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
  %3 = load i32, i32* @globalFive, align 4, !dbg !27
  %cmp = icmp eq i32 %3, 5, !dbg !29
  br i1 %cmp, label %if.then, label %if.end, !dbg !30

if.then:                                          ; preds = %entry
  %4 = load i32*, i32** %data, align 8, !dbg !31
  %call = call i32* @wmemset(i32* %4, i32 65, i64 99) #6, !dbg !33
  %5 = load i32*, i32** %data, align 8, !dbg !34
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 99, !dbg !34
  store i32 0, i32* %arrayidx, align 4, !dbg !35
  br label %if.end, !dbg !36

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !37, metadata !DIExpression()), !dbg !42
  %6 = bitcast [50 x i32]* %dest to i8*, !dbg !42
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 200, i1 false), !dbg !42
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !43
  %7 = load i32*, i32** %data, align 8, !dbg !44
  %8 = load i32*, i32** %data, align 8, !dbg !45
  %call1 = call i64 @wcslen(i32* %8) #7, !dbg !46
  %call2 = call i32* @wcsncpy(i32* %arraydecay, i32* %7, i64 %call1) #6, !dbg !47
  %arrayidx3 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !48
  store i32 0, i32* %arrayidx3, align 4, !dbg !49
  %9 = load i32*, i32** %data, align 8, !dbg !50
  call void @printWLine(i32* %9), !dbg !51
  ret void, !dbg !52
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nounwind
declare dso_local i32* @wcsncpy(i32*, i32*, i64) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #4

declare dso_local void @printWLine(i32*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_ncpy_14_good() #0 !dbg !53 {
entry:
  call void @goodG2B1(), !dbg !54
  call void @goodG2B2(), !dbg !55
  ret void, !dbg !56
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !57 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !63, metadata !DIExpression()), !dbg !64
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !65, metadata !DIExpression()), !dbg !66
  %call = call i64 @time(i64* null) #6, !dbg !67
  %conv = trunc i64 %call to i32, !dbg !68
  call void @srand(i32 %conv) #6, !dbg !69
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !70
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_ncpy_14_good(), !dbg !71
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !72
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !73
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_ncpy_14_bad(), !dbg !74
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !75
  ret i32 0, !dbg !76
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !77 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !78, metadata !DIExpression()), !dbg !79
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !80, metadata !DIExpression()), !dbg !81
  %0 = alloca i8, i64 400, align 16, !dbg !82
  %1 = bitcast i8* %0 to i32*, !dbg !83
  store i32* %1, i32** %dataBuffer, align 8, !dbg !81
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !84
  store i32* %2, i32** %data, align 8, !dbg !85
  %3 = load i32, i32* @globalFive, align 4, !dbg !86
  %cmp = icmp ne i32 %3, 5, !dbg !88
  br i1 %cmp, label %if.then, label %if.else, !dbg !89

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !90
  br label %if.end, !dbg !92

if.else:                                          ; preds = %entry
  %4 = load i32*, i32** %data, align 8, !dbg !93
  %call = call i32* @wmemset(i32* %4, i32 65, i64 49) #6, !dbg !95
  %5 = load i32*, i32** %data, align 8, !dbg !96
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 49, !dbg !96
  store i32 0, i32* %arrayidx, align 4, !dbg !97
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !98, metadata !DIExpression()), !dbg !100
  %6 = bitcast [50 x i32]* %dest to i8*, !dbg !100
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 200, i1 false), !dbg !100
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !101
  %7 = load i32*, i32** %data, align 8, !dbg !102
  %8 = load i32*, i32** %data, align 8, !dbg !103
  %call1 = call i64 @wcslen(i32* %8) #7, !dbg !104
  %call2 = call i32* @wcsncpy(i32* %arraydecay, i32* %7, i64 %call1) #6, !dbg !105
  %arrayidx3 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !106
  store i32 0, i32* %arrayidx3, align 4, !dbg !107
  %9 = load i32*, i32** %data, align 8, !dbg !108
  call void @printWLine(i32* %9), !dbg !109
  ret void, !dbg !110
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !111 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !112, metadata !DIExpression()), !dbg !113
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !114, metadata !DIExpression()), !dbg !115
  %0 = alloca i8, i64 400, align 16, !dbg !116
  %1 = bitcast i8* %0 to i32*, !dbg !117
  store i32* %1, i32** %dataBuffer, align 8, !dbg !115
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !118
  store i32* %2, i32** %data, align 8, !dbg !119
  %3 = load i32, i32* @globalFive, align 4, !dbg !120
  %cmp = icmp eq i32 %3, 5, !dbg !122
  br i1 %cmp, label %if.then, label %if.end, !dbg !123

if.then:                                          ; preds = %entry
  %4 = load i32*, i32** %data, align 8, !dbg !124
  %call = call i32* @wmemset(i32* %4, i32 65, i64 49) #6, !dbg !126
  %5 = load i32*, i32** %data, align 8, !dbg !127
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 49, !dbg !127
  store i32 0, i32* %arrayidx, align 4, !dbg !128
  br label %if.end, !dbg !129

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !130, metadata !DIExpression()), !dbg !132
  %6 = bitcast [50 x i32]* %dest to i8*, !dbg !132
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 200, i1 false), !dbg !132
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !133
  %7 = load i32*, i32** %data, align 8, !dbg !134
  %8 = load i32*, i32** %data, align 8, !dbg !135
  %call1 = call i64 @wcslen(i32* %8) #7, !dbg !136
  %call2 = call i32* @wcsncpy(i32* %arraydecay, i32* %7, i64 %call1) #6, !dbg !137
  %arrayidx3 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !138
  store i32 0, i32* %arrayidx3, align 4, !dbg !139
  %9 = load i32*, i32** %data, align 8, !dbg !140
  call void @printWLine(i32* %9), !dbg !141
  ret void, !dbg !142
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_ncpy_14.c", directory: "/root/SSE-Assessment")
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
!15 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_ncpy_14_bad", scope: !16, file: !16, line: 23, type: !17, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_ncpy_14.c", directory: "/root/SSE-Assessment")
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
!29 = !DILocation(line: 28, column: 18, scope: !28)
!30 = !DILocation(line: 28, column: 8, scope: !15)
!31 = !DILocation(line: 31, column: 17, scope: !32)
!32 = distinct !DILexicalBlock(scope: !28, file: !16, line: 29, column: 5)
!33 = !DILocation(line: 31, column: 9, scope: !32)
!34 = !DILocation(line: 32, column: 9, scope: !32)
!35 = !DILocation(line: 32, column: 21, scope: !32)
!36 = !DILocation(line: 33, column: 5, scope: !32)
!37 = !DILocalVariable(name: "dest", scope: !38, file: !16, line: 35, type: !39)
!38 = distinct !DILexicalBlock(scope: !15, file: !16, line: 34, column: 5)
!39 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 1600, elements: !40)
!40 = !{!41}
!41 = !DISubrange(count: 50)
!42 = !DILocation(line: 35, column: 17, scope: !38)
!43 = !DILocation(line: 37, column: 17, scope: !38)
!44 = !DILocation(line: 37, column: 23, scope: !38)
!45 = !DILocation(line: 37, column: 36, scope: !38)
!46 = !DILocation(line: 37, column: 29, scope: !38)
!47 = !DILocation(line: 37, column: 9, scope: !38)
!48 = !DILocation(line: 38, column: 9, scope: !38)
!49 = !DILocation(line: 38, column: 20, scope: !38)
!50 = !DILocation(line: 39, column: 20, scope: !38)
!51 = !DILocation(line: 39, column: 9, scope: !38)
!52 = !DILocation(line: 41, column: 1, scope: !15)
!53 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_ncpy_14_good", scope: !16, file: !16, line: 94, type: !17, scopeLine: 95, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!54 = !DILocation(line: 96, column: 5, scope: !53)
!55 = !DILocation(line: 97, column: 5, scope: !53)
!56 = !DILocation(line: 98, column: 1, scope: !53)
!57 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 110, type: !58, scopeLine: 111, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!58 = !DISubroutineType(types: !59)
!59 = !{!7, !7, !60}
!60 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !61, size: 64)
!61 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !62, size: 64)
!62 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!63 = !DILocalVariable(name: "argc", arg: 1, scope: !57, file: !16, line: 110, type: !7)
!64 = !DILocation(line: 110, column: 14, scope: !57)
!65 = !DILocalVariable(name: "argv", arg: 2, scope: !57, file: !16, line: 110, type: !60)
!66 = !DILocation(line: 110, column: 27, scope: !57)
!67 = !DILocation(line: 113, column: 22, scope: !57)
!68 = !DILocation(line: 113, column: 12, scope: !57)
!69 = !DILocation(line: 113, column: 5, scope: !57)
!70 = !DILocation(line: 115, column: 5, scope: !57)
!71 = !DILocation(line: 116, column: 5, scope: !57)
!72 = !DILocation(line: 117, column: 5, scope: !57)
!73 = !DILocation(line: 120, column: 5, scope: !57)
!74 = !DILocation(line: 121, column: 5, scope: !57)
!75 = !DILocation(line: 122, column: 5, scope: !57)
!76 = !DILocation(line: 124, column: 5, scope: !57)
!77 = distinct !DISubprogram(name: "goodG2B1", scope: !16, file: !16, line: 48, type: !17, scopeLine: 49, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!78 = !DILocalVariable(name: "data", scope: !77, file: !16, line: 50, type: !4)
!79 = !DILocation(line: 50, column: 15, scope: !77)
!80 = !DILocalVariable(name: "dataBuffer", scope: !77, file: !16, line: 51, type: !4)
!81 = !DILocation(line: 51, column: 15, scope: !77)
!82 = !DILocation(line: 51, column: 39, scope: !77)
!83 = !DILocation(line: 51, column: 28, scope: !77)
!84 = !DILocation(line: 52, column: 12, scope: !77)
!85 = !DILocation(line: 52, column: 10, scope: !77)
!86 = !DILocation(line: 53, column: 8, scope: !87)
!87 = distinct !DILexicalBlock(scope: !77, file: !16, line: 53, column: 8)
!88 = !DILocation(line: 53, column: 18, scope: !87)
!89 = !DILocation(line: 53, column: 8, scope: !77)
!90 = !DILocation(line: 56, column: 9, scope: !91)
!91 = distinct !DILexicalBlock(scope: !87, file: !16, line: 54, column: 5)
!92 = !DILocation(line: 57, column: 5, scope: !91)
!93 = !DILocation(line: 61, column: 17, scope: !94)
!94 = distinct !DILexicalBlock(scope: !87, file: !16, line: 59, column: 5)
!95 = !DILocation(line: 61, column: 9, scope: !94)
!96 = !DILocation(line: 62, column: 9, scope: !94)
!97 = !DILocation(line: 62, column: 20, scope: !94)
!98 = !DILocalVariable(name: "dest", scope: !99, file: !16, line: 65, type: !39)
!99 = distinct !DILexicalBlock(scope: !77, file: !16, line: 64, column: 5)
!100 = !DILocation(line: 65, column: 17, scope: !99)
!101 = !DILocation(line: 67, column: 17, scope: !99)
!102 = !DILocation(line: 67, column: 23, scope: !99)
!103 = !DILocation(line: 67, column: 36, scope: !99)
!104 = !DILocation(line: 67, column: 29, scope: !99)
!105 = !DILocation(line: 67, column: 9, scope: !99)
!106 = !DILocation(line: 68, column: 9, scope: !99)
!107 = !DILocation(line: 68, column: 20, scope: !99)
!108 = !DILocation(line: 69, column: 20, scope: !99)
!109 = !DILocation(line: 69, column: 9, scope: !99)
!110 = !DILocation(line: 71, column: 1, scope: !77)
!111 = distinct !DISubprogram(name: "goodG2B2", scope: !16, file: !16, line: 74, type: !17, scopeLine: 75, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!112 = !DILocalVariable(name: "data", scope: !111, file: !16, line: 76, type: !4)
!113 = !DILocation(line: 76, column: 15, scope: !111)
!114 = !DILocalVariable(name: "dataBuffer", scope: !111, file: !16, line: 77, type: !4)
!115 = !DILocation(line: 77, column: 15, scope: !111)
!116 = !DILocation(line: 77, column: 39, scope: !111)
!117 = !DILocation(line: 77, column: 28, scope: !111)
!118 = !DILocation(line: 78, column: 12, scope: !111)
!119 = !DILocation(line: 78, column: 10, scope: !111)
!120 = !DILocation(line: 79, column: 8, scope: !121)
!121 = distinct !DILexicalBlock(scope: !111, file: !16, line: 79, column: 8)
!122 = !DILocation(line: 79, column: 18, scope: !121)
!123 = !DILocation(line: 79, column: 8, scope: !111)
!124 = !DILocation(line: 82, column: 17, scope: !125)
!125 = distinct !DILexicalBlock(scope: !121, file: !16, line: 80, column: 5)
!126 = !DILocation(line: 82, column: 9, scope: !125)
!127 = !DILocation(line: 83, column: 9, scope: !125)
!128 = !DILocation(line: 83, column: 20, scope: !125)
!129 = !DILocation(line: 84, column: 5, scope: !125)
!130 = !DILocalVariable(name: "dest", scope: !131, file: !16, line: 86, type: !39)
!131 = distinct !DILexicalBlock(scope: !111, file: !16, line: 85, column: 5)
!132 = !DILocation(line: 86, column: 17, scope: !131)
!133 = !DILocation(line: 88, column: 17, scope: !131)
!134 = !DILocation(line: 88, column: 23, scope: !131)
!135 = !DILocation(line: 88, column: 36, scope: !131)
!136 = !DILocation(line: 88, column: 29, scope: !131)
!137 = !DILocation(line: 88, column: 9, scope: !131)
!138 = !DILocation(line: 89, column: 9, scope: !131)
!139 = !DILocation(line: 89, column: 20, scope: !131)
!140 = !DILocation(line: 90, column: 20, scope: !131)
!141 = !DILocation(line: 90, column: 9, scope: !131)
!142 = !DILocation(line: 92, column: 1, scope: !111)
