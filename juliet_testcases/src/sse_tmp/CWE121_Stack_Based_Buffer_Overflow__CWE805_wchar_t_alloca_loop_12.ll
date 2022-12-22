; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_12.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_12.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_12_bad() #0 !dbg !15 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %i = alloca i64, align 8
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
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !29
  %tobool = icmp ne i32 %call, 0, !dbg !29
  br i1 %tobool, label %if.then, label %if.else, !dbg !31

if.then:                                          ; preds = %entry
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !32
  store i32* %4, i32** %data, align 8, !dbg !34
  %5 = load i32*, i32** %data, align 8, !dbg !35
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !35
  store i32 0, i32* %arrayidx, align 4, !dbg !36
  br label %if.end, !dbg !37

if.else:                                          ; preds = %entry
  %6 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !38
  store i32* %6, i32** %data, align 8, !dbg !40
  %7 = load i32*, i32** %data, align 8, !dbg !41
  %arrayidx1 = getelementptr inbounds i32, i32* %7, i64 0, !dbg !41
  store i32 0, i32* %arrayidx1, align 4, !dbg !42
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata i64* %i, metadata !43, metadata !DIExpression()), !dbg !47
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !48, metadata !DIExpression()), !dbg !52
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !53
  %call2 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !54
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !55
  store i32 0, i32* %arrayidx3, align 4, !dbg !56
  store i64 0, i64* %i, align 8, !dbg !57
  br label %for.cond, !dbg !59

for.cond:                                         ; preds = %for.inc, %if.end
  %8 = load i64, i64* %i, align 8, !dbg !60
  %cmp = icmp ult i64 %8, 100, !dbg !62
  br i1 %cmp, label %for.body, label %for.end, !dbg !63

for.body:                                         ; preds = %for.cond
  %9 = load i64, i64* %i, align 8, !dbg !64
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %9, !dbg !66
  %10 = load i32, i32* %arrayidx4, align 4, !dbg !66
  %11 = load i32*, i32** %data, align 8, !dbg !67
  %12 = load i64, i64* %i, align 8, !dbg !68
  %arrayidx5 = getelementptr inbounds i32, i32* %11, i64 %12, !dbg !67
  store i32 %10, i32* %arrayidx5, align 4, !dbg !69
  br label %for.inc, !dbg !70

for.inc:                                          ; preds = %for.body
  %13 = load i64, i64* %i, align 8, !dbg !71
  %inc = add i64 %13, 1, !dbg !71
  store i64 %inc, i64* %i, align 8, !dbg !71
  br label %for.cond, !dbg !72, !llvm.loop !73

for.end:                                          ; preds = %for.cond
  %14 = load i32*, i32** %data, align 8, !dbg !76
  %arrayidx6 = getelementptr inbounds i32, i32* %14, i64 99, !dbg !76
  store i32 0, i32* %arrayidx6, align 4, !dbg !77
  %15 = load i32*, i32** %data, align 8, !dbg !78
  call void @printWLine(i32* %15), !dbg !79
  ret void, !dbg !80
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @globalReturnsTrueOrFalse(...) #2

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #3

declare dso_local void @printWLine(i32*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_12_good() #0 !dbg !81 {
entry:
  call void @goodG2B(), !dbg !82
  ret void, !dbg !83
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !84 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !90, metadata !DIExpression()), !dbg !91
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !92, metadata !DIExpression()), !dbg !93
  %call = call i64 @time(i64* null) #4, !dbg !94
  %conv = trunc i64 %call to i32, !dbg !95
  call void @srand(i32 %conv) #4, !dbg !96
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !97
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_12_good(), !dbg !98
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !99
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !100
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_12_bad(), !dbg !101
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !102
  ret i32 0, !dbg !103
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !104 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !105, metadata !DIExpression()), !dbg !106
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !107, metadata !DIExpression()), !dbg !108
  %0 = alloca i8, i64 200, align 16, !dbg !109
  %1 = bitcast i8* %0 to i32*, !dbg !110
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !108
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !111, metadata !DIExpression()), !dbg !112
  %2 = alloca i8, i64 400, align 16, !dbg !113
  %3 = bitcast i8* %2 to i32*, !dbg !114
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !112
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !115
  %tobool = icmp ne i32 %call, 0, !dbg !115
  br i1 %tobool, label %if.then, label %if.else, !dbg !117

if.then:                                          ; preds = %entry
  %4 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !118
  store i32* %4, i32** %data, align 8, !dbg !120
  %5 = load i32*, i32** %data, align 8, !dbg !121
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !121
  store i32 0, i32* %arrayidx, align 4, !dbg !122
  br label %if.end, !dbg !123

if.else:                                          ; preds = %entry
  %6 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !124
  store i32* %6, i32** %data, align 8, !dbg !126
  %7 = load i32*, i32** %data, align 8, !dbg !127
  %arrayidx1 = getelementptr inbounds i32, i32* %7, i64 0, !dbg !127
  store i32 0, i32* %arrayidx1, align 4, !dbg !128
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata i64* %i, metadata !129, metadata !DIExpression()), !dbg !131
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !132, metadata !DIExpression()), !dbg !133
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !134
  %call2 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !135
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !136
  store i32 0, i32* %arrayidx3, align 4, !dbg !137
  store i64 0, i64* %i, align 8, !dbg !138
  br label %for.cond, !dbg !140

for.cond:                                         ; preds = %for.inc, %if.end
  %8 = load i64, i64* %i, align 8, !dbg !141
  %cmp = icmp ult i64 %8, 100, !dbg !143
  br i1 %cmp, label %for.body, label %for.end, !dbg !144

for.body:                                         ; preds = %for.cond
  %9 = load i64, i64* %i, align 8, !dbg !145
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %9, !dbg !147
  %10 = load i32, i32* %arrayidx4, align 4, !dbg !147
  %11 = load i32*, i32** %data, align 8, !dbg !148
  %12 = load i64, i64* %i, align 8, !dbg !149
  %arrayidx5 = getelementptr inbounds i32, i32* %11, i64 %12, !dbg !148
  store i32 %10, i32* %arrayidx5, align 4, !dbg !150
  br label %for.inc, !dbg !151

for.inc:                                          ; preds = %for.body
  %13 = load i64, i64* %i, align 8, !dbg !152
  %inc = add i64 %13, 1, !dbg !152
  store i64 %inc, i64* %i, align 8, !dbg !152
  br label %for.cond, !dbg !153, !llvm.loop !154

for.end:                                          ; preds = %for.cond
  %14 = load i32*, i32** %data, align 8, !dbg !156
  %arrayidx6 = getelementptr inbounds i32, i32* %14, i64 99, !dbg !156
  store i32 0, i32* %arrayidx6, align 4, !dbg !157
  %15 = load i32*, i32** %data, align 8, !dbg !158
  call void @printWLine(i32* %15), !dbg !159
  ret void, !dbg !160
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_12.c", directory: "/root/SSE-Assessment")
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
!15 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_12_bad", scope: !16, file: !16, line: 23, type: !17, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_12.c", directory: "/root/SSE-Assessment")
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
!31 = !DILocation(line: 28, column: 8, scope: !15)
!32 = !DILocation(line: 32, column: 16, scope: !33)
!33 = distinct !DILexicalBlock(scope: !30, file: !16, line: 29, column: 5)
!34 = !DILocation(line: 32, column: 14, scope: !33)
!35 = !DILocation(line: 33, column: 9, scope: !33)
!36 = !DILocation(line: 33, column: 17, scope: !33)
!37 = !DILocation(line: 34, column: 5, scope: !33)
!38 = !DILocation(line: 38, column: 16, scope: !39)
!39 = distinct !DILexicalBlock(scope: !30, file: !16, line: 36, column: 5)
!40 = !DILocation(line: 38, column: 14, scope: !39)
!41 = !DILocation(line: 39, column: 9, scope: !39)
!42 = !DILocation(line: 39, column: 17, scope: !39)
!43 = !DILocalVariable(name: "i", scope: !44, file: !16, line: 42, type: !45)
!44 = distinct !DILexicalBlock(scope: !15, file: !16, line: 41, column: 5)
!45 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !6, line: 46, baseType: !46)
!46 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!47 = !DILocation(line: 42, column: 16, scope: !44)
!48 = !DILocalVariable(name: "source", scope: !44, file: !16, line: 43, type: !49)
!49 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !50)
!50 = !{!51}
!51 = !DISubrange(count: 100)
!52 = !DILocation(line: 43, column: 17, scope: !44)
!53 = !DILocation(line: 44, column: 17, scope: !44)
!54 = !DILocation(line: 44, column: 9, scope: !44)
!55 = !DILocation(line: 45, column: 9, scope: !44)
!56 = !DILocation(line: 45, column: 23, scope: !44)
!57 = !DILocation(line: 47, column: 16, scope: !58)
!58 = distinct !DILexicalBlock(scope: !44, file: !16, line: 47, column: 9)
!59 = !DILocation(line: 47, column: 14, scope: !58)
!60 = !DILocation(line: 47, column: 21, scope: !61)
!61 = distinct !DILexicalBlock(scope: !58, file: !16, line: 47, column: 9)
!62 = !DILocation(line: 47, column: 23, scope: !61)
!63 = !DILocation(line: 47, column: 9, scope: !58)
!64 = !DILocation(line: 49, column: 30, scope: !65)
!65 = distinct !DILexicalBlock(scope: !61, file: !16, line: 48, column: 9)
!66 = !DILocation(line: 49, column: 23, scope: !65)
!67 = !DILocation(line: 49, column: 13, scope: !65)
!68 = !DILocation(line: 49, column: 18, scope: !65)
!69 = !DILocation(line: 49, column: 21, scope: !65)
!70 = !DILocation(line: 50, column: 9, scope: !65)
!71 = !DILocation(line: 47, column: 31, scope: !61)
!72 = !DILocation(line: 47, column: 9, scope: !61)
!73 = distinct !{!73, !63, !74, !75}
!74 = !DILocation(line: 50, column: 9, scope: !58)
!75 = !{!"llvm.loop.mustprogress"}
!76 = !DILocation(line: 51, column: 9, scope: !44)
!77 = !DILocation(line: 51, column: 21, scope: !44)
!78 = !DILocation(line: 52, column: 20, scope: !44)
!79 = !DILocation(line: 52, column: 9, scope: !44)
!80 = !DILocation(line: 54, column: 1, scope: !15)
!81 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_12_good", scope: !16, file: !16, line: 94, type: !17, scopeLine: 95, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!82 = !DILocation(line: 96, column: 5, scope: !81)
!83 = !DILocation(line: 97, column: 1, scope: !81)
!84 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 109, type: !85, scopeLine: 110, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!85 = !DISubroutineType(types: !86)
!86 = !{!7, !7, !87}
!87 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !88, size: 64)
!88 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !89, size: 64)
!89 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!90 = !DILocalVariable(name: "argc", arg: 1, scope: !84, file: !16, line: 109, type: !7)
!91 = !DILocation(line: 109, column: 14, scope: !84)
!92 = !DILocalVariable(name: "argv", arg: 2, scope: !84, file: !16, line: 109, type: !87)
!93 = !DILocation(line: 109, column: 27, scope: !84)
!94 = !DILocation(line: 112, column: 22, scope: !84)
!95 = !DILocation(line: 112, column: 12, scope: !84)
!96 = !DILocation(line: 112, column: 5, scope: !84)
!97 = !DILocation(line: 114, column: 5, scope: !84)
!98 = !DILocation(line: 115, column: 5, scope: !84)
!99 = !DILocation(line: 116, column: 5, scope: !84)
!100 = !DILocation(line: 119, column: 5, scope: !84)
!101 = !DILocation(line: 120, column: 5, scope: !84)
!102 = !DILocation(line: 121, column: 5, scope: !84)
!103 = !DILocation(line: 123, column: 5, scope: !84)
!104 = distinct !DISubprogram(name: "goodG2B", scope: !16, file: !16, line: 62, type: !17, scopeLine: 63, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!105 = !DILocalVariable(name: "data", scope: !104, file: !16, line: 64, type: !4)
!106 = !DILocation(line: 64, column: 15, scope: !104)
!107 = !DILocalVariable(name: "dataBadBuffer", scope: !104, file: !16, line: 65, type: !4)
!108 = !DILocation(line: 65, column: 15, scope: !104)
!109 = !DILocation(line: 65, column: 42, scope: !104)
!110 = !DILocation(line: 65, column: 31, scope: !104)
!111 = !DILocalVariable(name: "dataGoodBuffer", scope: !104, file: !16, line: 66, type: !4)
!112 = !DILocation(line: 66, column: 15, scope: !104)
!113 = !DILocation(line: 66, column: 43, scope: !104)
!114 = !DILocation(line: 66, column: 32, scope: !104)
!115 = !DILocation(line: 67, column: 8, scope: !116)
!116 = distinct !DILexicalBlock(scope: !104, file: !16, line: 67, column: 8)
!117 = !DILocation(line: 67, column: 8, scope: !104)
!118 = !DILocation(line: 70, column: 16, scope: !119)
!119 = distinct !DILexicalBlock(scope: !116, file: !16, line: 68, column: 5)
!120 = !DILocation(line: 70, column: 14, scope: !119)
!121 = !DILocation(line: 71, column: 9, scope: !119)
!122 = !DILocation(line: 71, column: 17, scope: !119)
!123 = !DILocation(line: 72, column: 5, scope: !119)
!124 = !DILocation(line: 76, column: 16, scope: !125)
!125 = distinct !DILexicalBlock(scope: !116, file: !16, line: 74, column: 5)
!126 = !DILocation(line: 76, column: 14, scope: !125)
!127 = !DILocation(line: 77, column: 9, scope: !125)
!128 = !DILocation(line: 77, column: 17, scope: !125)
!129 = !DILocalVariable(name: "i", scope: !130, file: !16, line: 80, type: !45)
!130 = distinct !DILexicalBlock(scope: !104, file: !16, line: 79, column: 5)
!131 = !DILocation(line: 80, column: 16, scope: !130)
!132 = !DILocalVariable(name: "source", scope: !130, file: !16, line: 81, type: !49)
!133 = !DILocation(line: 81, column: 17, scope: !130)
!134 = !DILocation(line: 82, column: 17, scope: !130)
!135 = !DILocation(line: 82, column: 9, scope: !130)
!136 = !DILocation(line: 83, column: 9, scope: !130)
!137 = !DILocation(line: 83, column: 23, scope: !130)
!138 = !DILocation(line: 85, column: 16, scope: !139)
!139 = distinct !DILexicalBlock(scope: !130, file: !16, line: 85, column: 9)
!140 = !DILocation(line: 85, column: 14, scope: !139)
!141 = !DILocation(line: 85, column: 21, scope: !142)
!142 = distinct !DILexicalBlock(scope: !139, file: !16, line: 85, column: 9)
!143 = !DILocation(line: 85, column: 23, scope: !142)
!144 = !DILocation(line: 85, column: 9, scope: !139)
!145 = !DILocation(line: 87, column: 30, scope: !146)
!146 = distinct !DILexicalBlock(scope: !142, file: !16, line: 86, column: 9)
!147 = !DILocation(line: 87, column: 23, scope: !146)
!148 = !DILocation(line: 87, column: 13, scope: !146)
!149 = !DILocation(line: 87, column: 18, scope: !146)
!150 = !DILocation(line: 87, column: 21, scope: !146)
!151 = !DILocation(line: 88, column: 9, scope: !146)
!152 = !DILocation(line: 85, column: 31, scope: !142)
!153 = !DILocation(line: 85, column: 9, scope: !142)
!154 = distinct !{!154, !144, !155, !75}
!155 = !DILocation(line: 88, column: 9, scope: !139)
!156 = !DILocation(line: 89, column: 9, scope: !130)
!157 = !DILocation(line: 89, column: 21, scope: !130)
!158 = !DILocation(line: 90, column: 20, scope: !130)
!159 = !DILocation(line: 90, column: 9, scope: !130)
!160 = !DILocation(line: 92, column: 1, scope: !104)
