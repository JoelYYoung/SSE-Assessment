; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_memcpy_13.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_memcpy_13.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@GLOBAL_CONST_FIVE = external dso_local constant i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_memcpy_13_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !15, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !21, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !26, metadata !DIExpression()), !dbg !30
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !31
  %cmp = icmp eq i32 %0, 5, !dbg !33
  br i1 %cmp, label %if.then, label %if.end, !dbg !34

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !35
  store i32* %arraydecay, i32** %data, align 8, !dbg !37
  %1 = load i32*, i32** %data, align 8, !dbg !38
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 0, !dbg !38
  store i32 0, i32* %arrayidx, align 4, !dbg !39
  br label %if.end, !dbg !40

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !41, metadata !DIExpression()), !dbg !43
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !44
  %call = call i32* @wmemset(i32* %arraydecay1, i32 67, i64 99) #5, !dbg !45
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !46
  store i32 0, i32* %arrayidx2, align 4, !dbg !47
  %2 = load i32*, i32** %data, align 8, !dbg !48
  %3 = bitcast i32* %2 to i8*, !dbg !49
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !49
  %4 = bitcast i32* %arraydecay3 to i8*, !dbg !49
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %3, i8* align 16 %4, i64 400, i1 false), !dbg !49
  %5 = load i32*, i32** %data, align 8, !dbg !50
  %arrayidx4 = getelementptr inbounds i32, i32* %5, i64 99, !dbg !50
  store i32 0, i32* %arrayidx4, align 4, !dbg !51
  %6 = load i32*, i32** %data, align 8, !dbg !52
  call void @printWLine(i32* %6), !dbg !53
  ret void, !dbg !54
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_memcpy_13_good() #0 !dbg !55 {
entry:
  call void @goodG2B1(), !dbg !56
  call void @goodG2B2(), !dbg !57
  ret void, !dbg !58
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !59 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !65, metadata !DIExpression()), !dbg !66
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !67, metadata !DIExpression()), !dbg !68
  %call = call i64 @time(i64* null) #5, !dbg !69
  %conv = trunc i64 %call to i32, !dbg !70
  call void @srand(i32 %conv) #5, !dbg !71
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !72
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_memcpy_13_good(), !dbg !73
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !74
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !75
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_memcpy_13_bad(), !dbg !76
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !77
  ret i32 0, !dbg !78
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !79 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !80, metadata !DIExpression()), !dbg !81
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !82, metadata !DIExpression()), !dbg !83
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !84, metadata !DIExpression()), !dbg !85
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !86
  %cmp = icmp ne i32 %0, 5, !dbg !88
  br i1 %cmp, label %if.then, label %if.else, !dbg !89

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !90
  br label %if.end, !dbg !92

if.else:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !93
  store i32* %arraydecay, i32** %data, align 8, !dbg !95
  %1 = load i32*, i32** %data, align 8, !dbg !96
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 0, !dbg !96
  store i32 0, i32* %arrayidx, align 4, !dbg !97
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !98, metadata !DIExpression()), !dbg !100
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !101
  %call = call i32* @wmemset(i32* %arraydecay1, i32 67, i64 99) #5, !dbg !102
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !103
  store i32 0, i32* %arrayidx2, align 4, !dbg !104
  %2 = load i32*, i32** %data, align 8, !dbg !105
  %3 = bitcast i32* %2 to i8*, !dbg !106
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !106
  %4 = bitcast i32* %arraydecay3 to i8*, !dbg !106
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %3, i8* align 16 %4, i64 400, i1 false), !dbg !106
  %5 = load i32*, i32** %data, align 8, !dbg !107
  %arrayidx4 = getelementptr inbounds i32, i32* %5, i64 99, !dbg !107
  store i32 0, i32* %arrayidx4, align 4, !dbg !108
  %6 = load i32*, i32** %data, align 8, !dbg !109
  call void @printWLine(i32* %6), !dbg !110
  ret void, !dbg !111
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !112 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !113, metadata !DIExpression()), !dbg !114
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !115, metadata !DIExpression()), !dbg !116
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !117, metadata !DIExpression()), !dbg !118
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !119
  %cmp = icmp eq i32 %0, 5, !dbg !121
  br i1 %cmp, label %if.then, label %if.end, !dbg !122

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !123
  store i32* %arraydecay, i32** %data, align 8, !dbg !125
  %1 = load i32*, i32** %data, align 8, !dbg !126
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 0, !dbg !126
  store i32 0, i32* %arrayidx, align 4, !dbg !127
  br label %if.end, !dbg !128

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !129, metadata !DIExpression()), !dbg !131
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !132
  %call = call i32* @wmemset(i32* %arraydecay1, i32 67, i64 99) #5, !dbg !133
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !134
  store i32 0, i32* %arrayidx2, align 4, !dbg !135
  %2 = load i32*, i32** %data, align 8, !dbg !136
  %3 = bitcast i32* %2 to i8*, !dbg !137
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !137
  %4 = bitcast i32* %arraydecay3 to i8*, !dbg !137
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %3, i8* align 16 %4, i64 400, i1 false), !dbg !137
  %5 = load i32*, i32** %data, align 8, !dbg !138
  %arrayidx4 = getelementptr inbounds i32, i32* %5, i64 99, !dbg !138
  store i32 0, i32* %arrayidx4, align 4, !dbg !139
  %6 = load i32*, i32** %data, align 8, !dbg !140
  call void @printWLine(i32* %6), !dbg !141
  ret void, !dbg !142
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_memcpy_13.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_memcpy_13_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_memcpy_13.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 25, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !18, line: 74, baseType: !19)
!18 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!19 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!20 = !DILocation(line: 25, column: 15, scope: !11)
!21 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 26, type: !22)
!22 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 1600, elements: !23)
!23 = !{!24}
!24 = !DISubrange(count: 50)
!25 = !DILocation(line: 26, column: 13, scope: !11)
!26 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 27, type: !27)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 3200, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 100)
!30 = !DILocation(line: 27, column: 13, scope: !11)
!31 = !DILocation(line: 28, column: 8, scope: !32)
!32 = distinct !DILexicalBlock(scope: !11, file: !12, line: 28, column: 8)
!33 = !DILocation(line: 28, column: 25, scope: !32)
!34 = !DILocation(line: 28, column: 8, scope: !11)
!35 = !DILocation(line: 32, column: 16, scope: !36)
!36 = distinct !DILexicalBlock(scope: !32, file: !12, line: 29, column: 5)
!37 = !DILocation(line: 32, column: 14, scope: !36)
!38 = !DILocation(line: 33, column: 9, scope: !36)
!39 = !DILocation(line: 33, column: 17, scope: !36)
!40 = !DILocation(line: 34, column: 5, scope: !36)
!41 = !DILocalVariable(name: "source", scope: !42, file: !12, line: 36, type: !27)
!42 = distinct !DILexicalBlock(scope: !11, file: !12, line: 35, column: 5)
!43 = !DILocation(line: 36, column: 17, scope: !42)
!44 = !DILocation(line: 37, column: 17, scope: !42)
!45 = !DILocation(line: 37, column: 9, scope: !42)
!46 = !DILocation(line: 38, column: 9, scope: !42)
!47 = !DILocation(line: 38, column: 23, scope: !42)
!48 = !DILocation(line: 40, column: 16, scope: !42)
!49 = !DILocation(line: 40, column: 9, scope: !42)
!50 = !DILocation(line: 41, column: 9, scope: !42)
!51 = !DILocation(line: 41, column: 21, scope: !42)
!52 = !DILocation(line: 42, column: 20, scope: !42)
!53 = !DILocation(line: 42, column: 9, scope: !42)
!54 = !DILocation(line: 44, column: 1, scope: !11)
!55 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_memcpy_13_good", scope: !12, file: !12, line: 101, type: !13, scopeLine: 102, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!56 = !DILocation(line: 103, column: 5, scope: !55)
!57 = !DILocation(line: 104, column: 5, scope: !55)
!58 = !DILocation(line: 105, column: 1, scope: !55)
!59 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 117, type: !60, scopeLine: 118, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!60 = !DISubroutineType(types: !61)
!61 = !{!19, !19, !62}
!62 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !63, size: 64)
!63 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !64, size: 64)
!64 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!65 = !DILocalVariable(name: "argc", arg: 1, scope: !59, file: !12, line: 117, type: !19)
!66 = !DILocation(line: 117, column: 14, scope: !59)
!67 = !DILocalVariable(name: "argv", arg: 2, scope: !59, file: !12, line: 117, type: !62)
!68 = !DILocation(line: 117, column: 27, scope: !59)
!69 = !DILocation(line: 120, column: 22, scope: !59)
!70 = !DILocation(line: 120, column: 12, scope: !59)
!71 = !DILocation(line: 120, column: 5, scope: !59)
!72 = !DILocation(line: 122, column: 5, scope: !59)
!73 = !DILocation(line: 123, column: 5, scope: !59)
!74 = !DILocation(line: 124, column: 5, scope: !59)
!75 = !DILocation(line: 127, column: 5, scope: !59)
!76 = !DILocation(line: 128, column: 5, scope: !59)
!77 = !DILocation(line: 129, column: 5, scope: !59)
!78 = !DILocation(line: 131, column: 5, scope: !59)
!79 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 51, type: !13, scopeLine: 52, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!80 = !DILocalVariable(name: "data", scope: !79, file: !12, line: 53, type: !16)
!81 = !DILocation(line: 53, column: 15, scope: !79)
!82 = !DILocalVariable(name: "dataBadBuffer", scope: !79, file: !12, line: 54, type: !22)
!83 = !DILocation(line: 54, column: 13, scope: !79)
!84 = !DILocalVariable(name: "dataGoodBuffer", scope: !79, file: !12, line: 55, type: !27)
!85 = !DILocation(line: 55, column: 13, scope: !79)
!86 = !DILocation(line: 56, column: 8, scope: !87)
!87 = distinct !DILexicalBlock(scope: !79, file: !12, line: 56, column: 8)
!88 = !DILocation(line: 56, column: 25, scope: !87)
!89 = !DILocation(line: 56, column: 8, scope: !79)
!90 = !DILocation(line: 59, column: 9, scope: !91)
!91 = distinct !DILexicalBlock(scope: !87, file: !12, line: 57, column: 5)
!92 = !DILocation(line: 60, column: 5, scope: !91)
!93 = !DILocation(line: 64, column: 16, scope: !94)
!94 = distinct !DILexicalBlock(scope: !87, file: !12, line: 62, column: 5)
!95 = !DILocation(line: 64, column: 14, scope: !94)
!96 = !DILocation(line: 65, column: 9, scope: !94)
!97 = !DILocation(line: 65, column: 17, scope: !94)
!98 = !DILocalVariable(name: "source", scope: !99, file: !12, line: 68, type: !27)
!99 = distinct !DILexicalBlock(scope: !79, file: !12, line: 67, column: 5)
!100 = !DILocation(line: 68, column: 17, scope: !99)
!101 = !DILocation(line: 69, column: 17, scope: !99)
!102 = !DILocation(line: 69, column: 9, scope: !99)
!103 = !DILocation(line: 70, column: 9, scope: !99)
!104 = !DILocation(line: 70, column: 23, scope: !99)
!105 = !DILocation(line: 72, column: 16, scope: !99)
!106 = !DILocation(line: 72, column: 9, scope: !99)
!107 = !DILocation(line: 73, column: 9, scope: !99)
!108 = !DILocation(line: 73, column: 21, scope: !99)
!109 = !DILocation(line: 74, column: 20, scope: !99)
!110 = !DILocation(line: 74, column: 9, scope: !99)
!111 = !DILocation(line: 76, column: 1, scope: !79)
!112 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 79, type: !13, scopeLine: 80, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!113 = !DILocalVariable(name: "data", scope: !112, file: !12, line: 81, type: !16)
!114 = !DILocation(line: 81, column: 15, scope: !112)
!115 = !DILocalVariable(name: "dataBadBuffer", scope: !112, file: !12, line: 82, type: !22)
!116 = !DILocation(line: 82, column: 13, scope: !112)
!117 = !DILocalVariable(name: "dataGoodBuffer", scope: !112, file: !12, line: 83, type: !27)
!118 = !DILocation(line: 83, column: 13, scope: !112)
!119 = !DILocation(line: 84, column: 8, scope: !120)
!120 = distinct !DILexicalBlock(scope: !112, file: !12, line: 84, column: 8)
!121 = !DILocation(line: 84, column: 25, scope: !120)
!122 = !DILocation(line: 84, column: 8, scope: !112)
!123 = !DILocation(line: 87, column: 16, scope: !124)
!124 = distinct !DILexicalBlock(scope: !120, file: !12, line: 85, column: 5)
!125 = !DILocation(line: 87, column: 14, scope: !124)
!126 = !DILocation(line: 88, column: 9, scope: !124)
!127 = !DILocation(line: 88, column: 17, scope: !124)
!128 = !DILocation(line: 89, column: 5, scope: !124)
!129 = !DILocalVariable(name: "source", scope: !130, file: !12, line: 91, type: !27)
!130 = distinct !DILexicalBlock(scope: !112, file: !12, line: 90, column: 5)
!131 = !DILocation(line: 91, column: 17, scope: !130)
!132 = !DILocation(line: 92, column: 17, scope: !130)
!133 = !DILocation(line: 92, column: 9, scope: !130)
!134 = !DILocation(line: 93, column: 9, scope: !130)
!135 = !DILocation(line: 93, column: 23, scope: !130)
!136 = !DILocation(line: 95, column: 16, scope: !130)
!137 = !DILocation(line: 95, column: 9, scope: !130)
!138 = !DILocation(line: 96, column: 9, scope: !130)
!139 = !DILocation(line: 96, column: 21, scope: !130)
!140 = !DILocation(line: 97, column: 20, scope: !130)
!141 = !DILocation(line: 97, column: 9, scope: !130)
!142 = !DILocation(line: 99, column: 1, scope: !112)
