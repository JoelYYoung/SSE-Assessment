; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_memcpy_14.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_memcpy_14.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@globalFive = external dso_local global i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_memcpy_14_bad() #0 !dbg !15 {
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
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !46
  %arrayidx1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !47
  store i32 0, i32* %arrayidx1, align 4, !dbg !48
  %7 = load i32*, i32** %data, align 8, !dbg !49
  %8 = bitcast i32* %7 to i8*, !dbg !50
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !50
  %9 = bitcast i32* %arraydecay2 to i8*, !dbg !50
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %8, i8* align 16 %9, i64 400, i1 false), !dbg !50
  %10 = load i32*, i32** %data, align 8, !dbg !51
  %arrayidx3 = getelementptr inbounds i32, i32* %10, i64 99, !dbg !51
  store i32 0, i32* %arrayidx3, align 4, !dbg !52
  %11 = load i32*, i32** %data, align 8, !dbg !53
  call void @printWLine(i32* %11), !dbg !54
  ret void, !dbg !55
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_memcpy_14_good() #0 !dbg !56 {
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
  %call = call i64 @time(i64* null) #5, !dbg !70
  %conv = trunc i64 %call to i32, !dbg !71
  call void @srand(i32 %conv) #5, !dbg !72
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !73
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_memcpy_14_good(), !dbg !74
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !75
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !76
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_memcpy_14_bad(), !dbg !77
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !78
  ret i32 0, !dbg !79
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !80 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !81, metadata !DIExpression()), !dbg !82
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !83, metadata !DIExpression()), !dbg !84
  %0 = alloca i8, i64 200, align 16, !dbg !85
  %1 = bitcast i8* %0 to i32*, !dbg !86
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !84
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !87, metadata !DIExpression()), !dbg !88
  %2 = alloca i8, i64 400, align 16, !dbg !89
  %3 = bitcast i8* %2 to i32*, !dbg !90
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !88
  %4 = load i32, i32* @globalFive, align 4, !dbg !91
  %cmp = icmp ne i32 %4, 5, !dbg !93
  br i1 %cmp, label %if.then, label %if.else, !dbg !94

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !95
  br label %if.end, !dbg !97

if.else:                                          ; preds = %entry
  %5 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !98
  store i32* %5, i32** %data, align 8, !dbg !100
  %6 = load i32*, i32** %data, align 8, !dbg !101
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 0, !dbg !101
  store i32 0, i32* %arrayidx, align 4, !dbg !102
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !103, metadata !DIExpression()), !dbg !105
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !106
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !107
  %arrayidx1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !108
  store i32 0, i32* %arrayidx1, align 4, !dbg !109
  %7 = load i32*, i32** %data, align 8, !dbg !110
  %8 = bitcast i32* %7 to i8*, !dbg !111
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !111
  %9 = bitcast i32* %arraydecay2 to i8*, !dbg !111
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %8, i8* align 16 %9, i64 400, i1 false), !dbg !111
  %10 = load i32*, i32** %data, align 8, !dbg !112
  %arrayidx3 = getelementptr inbounds i32, i32* %10, i64 99, !dbg !112
  store i32 0, i32* %arrayidx3, align 4, !dbg !113
  %11 = load i32*, i32** %data, align 8, !dbg !114
  call void @printWLine(i32* %11), !dbg !115
  ret void, !dbg !116
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !117 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !118, metadata !DIExpression()), !dbg !119
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !120, metadata !DIExpression()), !dbg !121
  %0 = alloca i8, i64 200, align 16, !dbg !122
  %1 = bitcast i8* %0 to i32*, !dbg !123
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !121
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !124, metadata !DIExpression()), !dbg !125
  %2 = alloca i8, i64 400, align 16, !dbg !126
  %3 = bitcast i8* %2 to i32*, !dbg !127
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !125
  %4 = load i32, i32* @globalFive, align 4, !dbg !128
  %cmp = icmp eq i32 %4, 5, !dbg !130
  br i1 %cmp, label %if.then, label %if.end, !dbg !131

if.then:                                          ; preds = %entry
  %5 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !132
  store i32* %5, i32** %data, align 8, !dbg !134
  %6 = load i32*, i32** %data, align 8, !dbg !135
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 0, !dbg !135
  store i32 0, i32* %arrayidx, align 4, !dbg !136
  br label %if.end, !dbg !137

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !138, metadata !DIExpression()), !dbg !140
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !141
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !142
  %arrayidx1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !143
  store i32 0, i32* %arrayidx1, align 4, !dbg !144
  %7 = load i32*, i32** %data, align 8, !dbg !145
  %8 = bitcast i32* %7 to i8*, !dbg !146
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !146
  %9 = bitcast i32* %arraydecay2 to i8*, !dbg !146
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %8, i8* align 16 %9, i64 400, i1 false), !dbg !146
  %10 = load i32*, i32** %data, align 8, !dbg !147
  %arrayidx3 = getelementptr inbounds i32, i32* %10, i64 99, !dbg !147
  store i32 0, i32* %arrayidx3, align 4, !dbg !148
  %11 = load i32*, i32** %data, align 8, !dbg !149
  call void @printWLine(i32* %11), !dbg !150
  ret void, !dbg !151
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_memcpy_14.c", directory: "/root/SSE-Assessment")
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
!15 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_memcpy_14_bad", scope: !16, file: !16, line: 23, type: !17, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_memcpy_14.c", directory: "/root/SSE-Assessment")
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
!49 = !DILocation(line: 40, column: 16, scope: !40)
!50 = !DILocation(line: 40, column: 9, scope: !40)
!51 = !DILocation(line: 41, column: 9, scope: !40)
!52 = !DILocation(line: 41, column: 21, scope: !40)
!53 = !DILocation(line: 42, column: 20, scope: !40)
!54 = !DILocation(line: 42, column: 9, scope: !40)
!55 = !DILocation(line: 44, column: 1, scope: !15)
!56 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_memcpy_14_good", scope: !16, file: !16, line: 101, type: !17, scopeLine: 102, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!57 = !DILocation(line: 103, column: 5, scope: !56)
!58 = !DILocation(line: 104, column: 5, scope: !56)
!59 = !DILocation(line: 105, column: 1, scope: !56)
!60 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 117, type: !61, scopeLine: 118, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!61 = !DISubroutineType(types: !62)
!62 = !{!7, !7, !63}
!63 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !64, size: 64)
!64 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !65, size: 64)
!65 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!66 = !DILocalVariable(name: "argc", arg: 1, scope: !60, file: !16, line: 117, type: !7)
!67 = !DILocation(line: 117, column: 14, scope: !60)
!68 = !DILocalVariable(name: "argv", arg: 2, scope: !60, file: !16, line: 117, type: !63)
!69 = !DILocation(line: 117, column: 27, scope: !60)
!70 = !DILocation(line: 120, column: 22, scope: !60)
!71 = !DILocation(line: 120, column: 12, scope: !60)
!72 = !DILocation(line: 120, column: 5, scope: !60)
!73 = !DILocation(line: 122, column: 5, scope: !60)
!74 = !DILocation(line: 123, column: 5, scope: !60)
!75 = !DILocation(line: 124, column: 5, scope: !60)
!76 = !DILocation(line: 127, column: 5, scope: !60)
!77 = !DILocation(line: 128, column: 5, scope: !60)
!78 = !DILocation(line: 129, column: 5, scope: !60)
!79 = !DILocation(line: 131, column: 5, scope: !60)
!80 = distinct !DISubprogram(name: "goodG2B1", scope: !16, file: !16, line: 51, type: !17, scopeLine: 52, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!81 = !DILocalVariable(name: "data", scope: !80, file: !16, line: 53, type: !4)
!82 = !DILocation(line: 53, column: 15, scope: !80)
!83 = !DILocalVariable(name: "dataBadBuffer", scope: !80, file: !16, line: 54, type: !4)
!84 = !DILocation(line: 54, column: 15, scope: !80)
!85 = !DILocation(line: 54, column: 42, scope: !80)
!86 = !DILocation(line: 54, column: 31, scope: !80)
!87 = !DILocalVariable(name: "dataGoodBuffer", scope: !80, file: !16, line: 55, type: !4)
!88 = !DILocation(line: 55, column: 15, scope: !80)
!89 = !DILocation(line: 55, column: 43, scope: !80)
!90 = !DILocation(line: 55, column: 32, scope: !80)
!91 = !DILocation(line: 56, column: 8, scope: !92)
!92 = distinct !DILexicalBlock(scope: !80, file: !16, line: 56, column: 8)
!93 = !DILocation(line: 56, column: 18, scope: !92)
!94 = !DILocation(line: 56, column: 8, scope: !80)
!95 = !DILocation(line: 59, column: 9, scope: !96)
!96 = distinct !DILexicalBlock(scope: !92, file: !16, line: 57, column: 5)
!97 = !DILocation(line: 60, column: 5, scope: !96)
!98 = !DILocation(line: 64, column: 16, scope: !99)
!99 = distinct !DILexicalBlock(scope: !92, file: !16, line: 62, column: 5)
!100 = !DILocation(line: 64, column: 14, scope: !99)
!101 = !DILocation(line: 65, column: 9, scope: !99)
!102 = !DILocation(line: 65, column: 17, scope: !99)
!103 = !DILocalVariable(name: "source", scope: !104, file: !16, line: 68, type: !41)
!104 = distinct !DILexicalBlock(scope: !80, file: !16, line: 67, column: 5)
!105 = !DILocation(line: 68, column: 17, scope: !104)
!106 = !DILocation(line: 69, column: 17, scope: !104)
!107 = !DILocation(line: 69, column: 9, scope: !104)
!108 = !DILocation(line: 70, column: 9, scope: !104)
!109 = !DILocation(line: 70, column: 23, scope: !104)
!110 = !DILocation(line: 72, column: 16, scope: !104)
!111 = !DILocation(line: 72, column: 9, scope: !104)
!112 = !DILocation(line: 73, column: 9, scope: !104)
!113 = !DILocation(line: 73, column: 21, scope: !104)
!114 = !DILocation(line: 74, column: 20, scope: !104)
!115 = !DILocation(line: 74, column: 9, scope: !104)
!116 = !DILocation(line: 76, column: 1, scope: !80)
!117 = distinct !DISubprogram(name: "goodG2B2", scope: !16, file: !16, line: 79, type: !17, scopeLine: 80, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!118 = !DILocalVariable(name: "data", scope: !117, file: !16, line: 81, type: !4)
!119 = !DILocation(line: 81, column: 15, scope: !117)
!120 = !DILocalVariable(name: "dataBadBuffer", scope: !117, file: !16, line: 82, type: !4)
!121 = !DILocation(line: 82, column: 15, scope: !117)
!122 = !DILocation(line: 82, column: 42, scope: !117)
!123 = !DILocation(line: 82, column: 31, scope: !117)
!124 = !DILocalVariable(name: "dataGoodBuffer", scope: !117, file: !16, line: 83, type: !4)
!125 = !DILocation(line: 83, column: 15, scope: !117)
!126 = !DILocation(line: 83, column: 43, scope: !117)
!127 = !DILocation(line: 83, column: 32, scope: !117)
!128 = !DILocation(line: 84, column: 8, scope: !129)
!129 = distinct !DILexicalBlock(scope: !117, file: !16, line: 84, column: 8)
!130 = !DILocation(line: 84, column: 18, scope: !129)
!131 = !DILocation(line: 84, column: 8, scope: !117)
!132 = !DILocation(line: 87, column: 16, scope: !133)
!133 = distinct !DILexicalBlock(scope: !129, file: !16, line: 85, column: 5)
!134 = !DILocation(line: 87, column: 14, scope: !133)
!135 = !DILocation(line: 88, column: 9, scope: !133)
!136 = !DILocation(line: 88, column: 17, scope: !133)
!137 = !DILocation(line: 89, column: 5, scope: !133)
!138 = !DILocalVariable(name: "source", scope: !139, file: !16, line: 91, type: !41)
!139 = distinct !DILexicalBlock(scope: !117, file: !16, line: 90, column: 5)
!140 = !DILocation(line: 91, column: 17, scope: !139)
!141 = !DILocation(line: 92, column: 17, scope: !139)
!142 = !DILocation(line: 92, column: 9, scope: !139)
!143 = !DILocation(line: 93, column: 9, scope: !139)
!144 = !DILocation(line: 93, column: 23, scope: !139)
!145 = !DILocation(line: 95, column: 16, scope: !139)
!146 = !DILocation(line: 95, column: 9, scope: !139)
!147 = !DILocation(line: 96, column: 9, scope: !139)
!148 = !DILocation(line: 96, column: 21, scope: !139)
!149 = !DILocation(line: 97, column: 20, scope: !139)
!150 = !DILocation(line: 97, column: 9, scope: !139)
!151 = !DILocation(line: 99, column: 1, scope: !117)
