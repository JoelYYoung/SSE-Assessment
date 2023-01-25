; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_memmove_05.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_memmove_05.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticTrue = internal global i32 1, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@staticFalse = internal global i32 0, align 4, !dbg !8
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_memmove_05_bad() #0 !dbg !18 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !21, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !26, metadata !DIExpression()), !dbg !30
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !31, metadata !DIExpression()), !dbg !35
  %0 = load i32, i32* @staticTrue, align 4, !dbg !36
  %tobool = icmp ne i32 %0, 0, !dbg !36
  br i1 %tobool, label %if.then, label %if.end, !dbg !38

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !39
  store i32* %arraydecay, i32** %data, align 8, !dbg !41
  %1 = load i32*, i32** %data, align 8, !dbg !42
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 0, !dbg !42
  store i32 0, i32* %arrayidx, align 4, !dbg !43
  br label %if.end, !dbg !44

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !45, metadata !DIExpression()), !dbg !47
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !48
  %call = call i32* @wmemset(i32* %arraydecay1, i32 67, i64 99) #5, !dbg !49
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !50
  store i32 0, i32* %arrayidx2, align 4, !dbg !51
  %2 = load i32*, i32** %data, align 8, !dbg !52
  %3 = bitcast i32* %2 to i8*, !dbg !53
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !53
  %4 = bitcast i32* %arraydecay3 to i8*, !dbg !53
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %3, i8* align 16 %4, i64 400, i1 false), !dbg !53
  %5 = load i32*, i32** %data, align 8, !dbg !54
  %arrayidx4 = getelementptr inbounds i32, i32* %5, i64 99, !dbg !54
  store i32 0, i32* %arrayidx4, align 4, !dbg !55
  %6 = load i32*, i32** %data, align 8, !dbg !56
  call void @printWLine(i32* %6), !dbg !57
  ret void, !dbg !58
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_memmove_05_good() #0 !dbg !59 {
entry:
  call void @goodG2B1(), !dbg !60
  call void @goodG2B2(), !dbg !61
  ret void, !dbg !62
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !63 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !69, metadata !DIExpression()), !dbg !70
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !71, metadata !DIExpression()), !dbg !72
  %call = call i64 @time(i64* null) #5, !dbg !73
  %conv = trunc i64 %call to i32, !dbg !74
  call void @srand(i32 %conv) #5, !dbg !75
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !76
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_memmove_05_good(), !dbg !77
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !78
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !79
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_memmove_05_bad(), !dbg !80
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !81
  ret i32 0, !dbg !82
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !83 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !84, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !86, metadata !DIExpression()), !dbg !87
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !88, metadata !DIExpression()), !dbg !89
  %0 = load i32, i32* @staticFalse, align 4, !dbg !90
  %tobool = icmp ne i32 %0, 0, !dbg !90
  br i1 %tobool, label %if.then, label %if.else, !dbg !92

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !93
  br label %if.end, !dbg !95

if.else:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !96
  store i32* %arraydecay, i32** %data, align 8, !dbg !98
  %1 = load i32*, i32** %data, align 8, !dbg !99
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 0, !dbg !99
  store i32 0, i32* %arrayidx, align 4, !dbg !100
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !101, metadata !DIExpression()), !dbg !103
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !104
  %call = call i32* @wmemset(i32* %arraydecay1, i32 67, i64 99) #5, !dbg !105
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !106
  store i32 0, i32* %arrayidx2, align 4, !dbg !107
  %2 = load i32*, i32** %data, align 8, !dbg !108
  %3 = bitcast i32* %2 to i8*, !dbg !109
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !109
  %4 = bitcast i32* %arraydecay3 to i8*, !dbg !109
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %3, i8* align 16 %4, i64 400, i1 false), !dbg !109
  %5 = load i32*, i32** %data, align 8, !dbg !110
  %arrayidx4 = getelementptr inbounds i32, i32* %5, i64 99, !dbg !110
  store i32 0, i32* %arrayidx4, align 4, !dbg !111
  %6 = load i32*, i32** %data, align 8, !dbg !112
  call void @printWLine(i32* %6), !dbg !113
  ret void, !dbg !114
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !115 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !116, metadata !DIExpression()), !dbg !117
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !118, metadata !DIExpression()), !dbg !119
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !120, metadata !DIExpression()), !dbg !121
  %0 = load i32, i32* @staticTrue, align 4, !dbg !122
  %tobool = icmp ne i32 %0, 0, !dbg !122
  br i1 %tobool, label %if.then, label %if.end, !dbg !124

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !125
  store i32* %arraydecay, i32** %data, align 8, !dbg !127
  %1 = load i32*, i32** %data, align 8, !dbg !128
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 0, !dbg !128
  store i32 0, i32* %arrayidx, align 4, !dbg !129
  br label %if.end, !dbg !130

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !131, metadata !DIExpression()), !dbg !133
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !134
  %call = call i32* @wmemset(i32* %arraydecay1, i32 67, i64 99) #5, !dbg !135
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !136
  store i32 0, i32* %arrayidx2, align 4, !dbg !137
  %2 = load i32*, i32** %data, align 8, !dbg !138
  %3 = bitcast i32* %2 to i8*, !dbg !139
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !139
  %4 = bitcast i32* %arraydecay3 to i8*, !dbg !139
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %3, i8* align 16 %4, i64 400, i1 false), !dbg !139
  %5 = load i32*, i32** %data, align 8, !dbg !140
  %arrayidx4 = getelementptr inbounds i32, i32* %5, i64 99, !dbg !140
  store i32 0, i32* %arrayidx4, align 4, !dbg !141
  %6 = load i32*, i32** %data, align 8, !dbg !142
  call void @printWLine(i32* %6), !dbg !143
  ret void, !dbg !144
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!12, !13, !14, !15, !16}
!llvm.ident = !{!17}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !10, line: 25, type: !11, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_memmove_05.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0, !8}
!8 = !DIGlobalVariableExpression(var: !9, expr: !DIExpression())
!9 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !10, line: 26, type: !11, isLocal: true, isDefinition: true)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_memmove_05.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !{i32 7, !"Dwarf Version", i32 4}
!13 = !{i32 2, !"Debug Info Version", i32 3}
!14 = !{i32 1, !"wchar_size", i32 4}
!15 = !{i32 7, !"uwtable", i32 1}
!16 = !{i32 7, !"frame-pointer", i32 2}
!17 = !{!"clang version 13.0.0"}
!18 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_memmove_05_bad", scope: !10, file: !10, line: 30, type: !19, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !DILocalVariable(name: "data", scope: !18, file: !10, line: 32, type: !22)
!22 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !23, size: 64)
!23 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !24, line: 74, baseType: !11)
!24 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!25 = !DILocation(line: 32, column: 15, scope: !18)
!26 = !DILocalVariable(name: "dataBadBuffer", scope: !18, file: !10, line: 33, type: !27)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !23, size: 1600, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 50)
!30 = !DILocation(line: 33, column: 13, scope: !18)
!31 = !DILocalVariable(name: "dataGoodBuffer", scope: !18, file: !10, line: 34, type: !32)
!32 = !DICompositeType(tag: DW_TAG_array_type, baseType: !23, size: 3200, elements: !33)
!33 = !{!34}
!34 = !DISubrange(count: 100)
!35 = !DILocation(line: 34, column: 13, scope: !18)
!36 = !DILocation(line: 35, column: 8, scope: !37)
!37 = distinct !DILexicalBlock(scope: !18, file: !10, line: 35, column: 8)
!38 = !DILocation(line: 35, column: 8, scope: !18)
!39 = !DILocation(line: 39, column: 16, scope: !40)
!40 = distinct !DILexicalBlock(scope: !37, file: !10, line: 36, column: 5)
!41 = !DILocation(line: 39, column: 14, scope: !40)
!42 = !DILocation(line: 40, column: 9, scope: !40)
!43 = !DILocation(line: 40, column: 17, scope: !40)
!44 = !DILocation(line: 41, column: 5, scope: !40)
!45 = !DILocalVariable(name: "source", scope: !46, file: !10, line: 43, type: !32)
!46 = distinct !DILexicalBlock(scope: !18, file: !10, line: 42, column: 5)
!47 = !DILocation(line: 43, column: 17, scope: !46)
!48 = !DILocation(line: 44, column: 17, scope: !46)
!49 = !DILocation(line: 44, column: 9, scope: !46)
!50 = !DILocation(line: 45, column: 9, scope: !46)
!51 = !DILocation(line: 45, column: 23, scope: !46)
!52 = !DILocation(line: 47, column: 17, scope: !46)
!53 = !DILocation(line: 47, column: 9, scope: !46)
!54 = !DILocation(line: 48, column: 9, scope: !46)
!55 = !DILocation(line: 48, column: 21, scope: !46)
!56 = !DILocation(line: 49, column: 20, scope: !46)
!57 = !DILocation(line: 49, column: 9, scope: !46)
!58 = !DILocation(line: 51, column: 1, scope: !18)
!59 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_memmove_05_good", scope: !10, file: !10, line: 108, type: !19, scopeLine: 109, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!60 = !DILocation(line: 110, column: 5, scope: !59)
!61 = !DILocation(line: 111, column: 5, scope: !59)
!62 = !DILocation(line: 112, column: 1, scope: !59)
!63 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 124, type: !64, scopeLine: 125, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!64 = !DISubroutineType(types: !65)
!65 = !{!11, !11, !66}
!66 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !67, size: 64)
!67 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !68, size: 64)
!68 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!69 = !DILocalVariable(name: "argc", arg: 1, scope: !63, file: !10, line: 124, type: !11)
!70 = !DILocation(line: 124, column: 14, scope: !63)
!71 = !DILocalVariable(name: "argv", arg: 2, scope: !63, file: !10, line: 124, type: !66)
!72 = !DILocation(line: 124, column: 27, scope: !63)
!73 = !DILocation(line: 127, column: 22, scope: !63)
!74 = !DILocation(line: 127, column: 12, scope: !63)
!75 = !DILocation(line: 127, column: 5, scope: !63)
!76 = !DILocation(line: 129, column: 5, scope: !63)
!77 = !DILocation(line: 130, column: 5, scope: !63)
!78 = !DILocation(line: 131, column: 5, scope: !63)
!79 = !DILocation(line: 134, column: 5, scope: !63)
!80 = !DILocation(line: 135, column: 5, scope: !63)
!81 = !DILocation(line: 136, column: 5, scope: !63)
!82 = !DILocation(line: 138, column: 5, scope: !63)
!83 = distinct !DISubprogram(name: "goodG2B1", scope: !10, file: !10, line: 58, type: !19, scopeLine: 59, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!84 = !DILocalVariable(name: "data", scope: !83, file: !10, line: 60, type: !22)
!85 = !DILocation(line: 60, column: 15, scope: !83)
!86 = !DILocalVariable(name: "dataBadBuffer", scope: !83, file: !10, line: 61, type: !27)
!87 = !DILocation(line: 61, column: 13, scope: !83)
!88 = !DILocalVariable(name: "dataGoodBuffer", scope: !83, file: !10, line: 62, type: !32)
!89 = !DILocation(line: 62, column: 13, scope: !83)
!90 = !DILocation(line: 63, column: 8, scope: !91)
!91 = distinct !DILexicalBlock(scope: !83, file: !10, line: 63, column: 8)
!92 = !DILocation(line: 63, column: 8, scope: !83)
!93 = !DILocation(line: 66, column: 9, scope: !94)
!94 = distinct !DILexicalBlock(scope: !91, file: !10, line: 64, column: 5)
!95 = !DILocation(line: 67, column: 5, scope: !94)
!96 = !DILocation(line: 71, column: 16, scope: !97)
!97 = distinct !DILexicalBlock(scope: !91, file: !10, line: 69, column: 5)
!98 = !DILocation(line: 71, column: 14, scope: !97)
!99 = !DILocation(line: 72, column: 9, scope: !97)
!100 = !DILocation(line: 72, column: 17, scope: !97)
!101 = !DILocalVariable(name: "source", scope: !102, file: !10, line: 75, type: !32)
!102 = distinct !DILexicalBlock(scope: !83, file: !10, line: 74, column: 5)
!103 = !DILocation(line: 75, column: 17, scope: !102)
!104 = !DILocation(line: 76, column: 17, scope: !102)
!105 = !DILocation(line: 76, column: 9, scope: !102)
!106 = !DILocation(line: 77, column: 9, scope: !102)
!107 = !DILocation(line: 77, column: 23, scope: !102)
!108 = !DILocation(line: 79, column: 17, scope: !102)
!109 = !DILocation(line: 79, column: 9, scope: !102)
!110 = !DILocation(line: 80, column: 9, scope: !102)
!111 = !DILocation(line: 80, column: 21, scope: !102)
!112 = !DILocation(line: 81, column: 20, scope: !102)
!113 = !DILocation(line: 81, column: 9, scope: !102)
!114 = !DILocation(line: 83, column: 1, scope: !83)
!115 = distinct !DISubprogram(name: "goodG2B2", scope: !10, file: !10, line: 86, type: !19, scopeLine: 87, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!116 = !DILocalVariable(name: "data", scope: !115, file: !10, line: 88, type: !22)
!117 = !DILocation(line: 88, column: 15, scope: !115)
!118 = !DILocalVariable(name: "dataBadBuffer", scope: !115, file: !10, line: 89, type: !27)
!119 = !DILocation(line: 89, column: 13, scope: !115)
!120 = !DILocalVariable(name: "dataGoodBuffer", scope: !115, file: !10, line: 90, type: !32)
!121 = !DILocation(line: 90, column: 13, scope: !115)
!122 = !DILocation(line: 91, column: 8, scope: !123)
!123 = distinct !DILexicalBlock(scope: !115, file: !10, line: 91, column: 8)
!124 = !DILocation(line: 91, column: 8, scope: !115)
!125 = !DILocation(line: 94, column: 16, scope: !126)
!126 = distinct !DILexicalBlock(scope: !123, file: !10, line: 92, column: 5)
!127 = !DILocation(line: 94, column: 14, scope: !126)
!128 = !DILocation(line: 95, column: 9, scope: !126)
!129 = !DILocation(line: 95, column: 17, scope: !126)
!130 = !DILocation(line: 96, column: 5, scope: !126)
!131 = !DILocalVariable(name: "source", scope: !132, file: !10, line: 98, type: !32)
!132 = distinct !DILexicalBlock(scope: !115, file: !10, line: 97, column: 5)
!133 = !DILocation(line: 98, column: 17, scope: !132)
!134 = !DILocation(line: 99, column: 17, scope: !132)
!135 = !DILocation(line: 99, column: 9, scope: !132)
!136 = !DILocation(line: 100, column: 9, scope: !132)
!137 = !DILocation(line: 100, column: 23, scope: !132)
!138 = !DILocation(line: 102, column: 17, scope: !132)
!139 = !DILocation(line: 102, column: 9, scope: !132)
!140 = !DILocation(line: 103, column: 9, scope: !132)
!141 = !DILocation(line: 103, column: 21, scope: !132)
!142 = !DILocation(line: 104, column: 20, scope: !132)
!143 = !DILocation(line: 104, column: 9, scope: !132)
!144 = !DILocation(line: 106, column: 1, scope: !115)
