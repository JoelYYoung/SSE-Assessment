; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_memmove_08.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_memmove_08.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_memmove_08_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !15, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !21, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !26, metadata !DIExpression()), !dbg !30
  %call = call i32 @staticReturnsTrue(), !dbg !31
  %tobool = icmp ne i32 %call, 0, !dbg !31
  br i1 %tobool, label %if.then, label %if.end, !dbg !33

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !34
  store i32* %arraydecay, i32** %data, align 8, !dbg !36
  %0 = load i32*, i32** %data, align 8, !dbg !37
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !37
  store i32 0, i32* %arrayidx, align 4, !dbg !38
  br label %if.end, !dbg !39

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !40, metadata !DIExpression()), !dbg !42
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !43
  %call2 = call i32* @wmemset(i32* %arraydecay1, i32 67, i64 99) #5, !dbg !44
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !45
  store i32 0, i32* %arrayidx3, align 4, !dbg !46
  %1 = load i32*, i32** %data, align 8, !dbg !47
  %2 = bitcast i32* %1 to i8*, !dbg !48
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !48
  %3 = bitcast i32* %arraydecay4 to i8*, !dbg !48
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %2, i8* align 16 %3, i64 400, i1 false), !dbg !48
  %4 = load i32*, i32** %data, align 8, !dbg !49
  %arrayidx5 = getelementptr inbounds i32, i32* %4, i64 99, !dbg !49
  store i32 0, i32* %arrayidx5, align 4, !dbg !50
  %5 = load i32*, i32** %data, align 8, !dbg !51
  call void @printWLine(i32* %5), !dbg !52
  ret void, !dbg !53
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_memmove_08_good() #0 !dbg !54 {
entry:
  call void @goodG2B1(), !dbg !55
  call void @goodG2B2(), !dbg !56
  ret void, !dbg !57
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !58 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !64, metadata !DIExpression()), !dbg !65
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !66, metadata !DIExpression()), !dbg !67
  %call = call i64 @time(i64* null) #5, !dbg !68
  %conv = trunc i64 %call to i32, !dbg !69
  call void @srand(i32 %conv) #5, !dbg !70
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !71
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_memmove_08_good(), !dbg !72
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !73
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !74
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_memmove_08_bad(), !dbg !75
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !76
  ret i32 0, !dbg !77
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !78 {
entry:
  ret i32 1, !dbg !81
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !82 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !83, metadata !DIExpression()), !dbg !84
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !85, metadata !DIExpression()), !dbg !86
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !87, metadata !DIExpression()), !dbg !88
  %call = call i32 @staticReturnsFalse(), !dbg !89
  %tobool = icmp ne i32 %call, 0, !dbg !89
  br i1 %tobool, label %if.then, label %if.else, !dbg !91

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !92
  br label %if.end, !dbg !94

if.else:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !95
  store i32* %arraydecay, i32** %data, align 8, !dbg !97
  %0 = load i32*, i32** %data, align 8, !dbg !98
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !98
  store i32 0, i32* %arrayidx, align 4, !dbg !99
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !100, metadata !DIExpression()), !dbg !102
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !103
  %call2 = call i32* @wmemset(i32* %arraydecay1, i32 67, i64 99) #5, !dbg !104
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !105
  store i32 0, i32* %arrayidx3, align 4, !dbg !106
  %1 = load i32*, i32** %data, align 8, !dbg !107
  %2 = bitcast i32* %1 to i8*, !dbg !108
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !108
  %3 = bitcast i32* %arraydecay4 to i8*, !dbg !108
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %2, i8* align 16 %3, i64 400, i1 false), !dbg !108
  %4 = load i32*, i32** %data, align 8, !dbg !109
  %arrayidx5 = getelementptr inbounds i32, i32* %4, i64 99, !dbg !109
  store i32 0, i32* %arrayidx5, align 4, !dbg !110
  %5 = load i32*, i32** %data, align 8, !dbg !111
  call void @printWLine(i32* %5), !dbg !112
  ret void, !dbg !113
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !114 {
entry:
  ret i32 0, !dbg !115
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !116 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !117, metadata !DIExpression()), !dbg !118
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !119, metadata !DIExpression()), !dbg !120
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !121, metadata !DIExpression()), !dbg !122
  %call = call i32 @staticReturnsTrue(), !dbg !123
  %tobool = icmp ne i32 %call, 0, !dbg !123
  br i1 %tobool, label %if.then, label %if.end, !dbg !125

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !126
  store i32* %arraydecay, i32** %data, align 8, !dbg !128
  %0 = load i32*, i32** %data, align 8, !dbg !129
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !129
  store i32 0, i32* %arrayidx, align 4, !dbg !130
  br label %if.end, !dbg !131

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !132, metadata !DIExpression()), !dbg !134
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !135
  %call2 = call i32* @wmemset(i32* %arraydecay1, i32 67, i64 99) #5, !dbg !136
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !137
  store i32 0, i32* %arrayidx3, align 4, !dbg !138
  %1 = load i32*, i32** %data, align 8, !dbg !139
  %2 = bitcast i32* %1 to i8*, !dbg !140
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !140
  %3 = bitcast i32* %arraydecay4 to i8*, !dbg !140
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %2, i8* align 16 %3, i64 400, i1 false), !dbg !140
  %4 = load i32*, i32** %data, align 8, !dbg !141
  %arrayidx5 = getelementptr inbounds i32, i32* %4, i64 99, !dbg !141
  store i32 0, i32* %arrayidx5, align 4, !dbg !142
  %5 = load i32*, i32** %data, align 8, !dbg !143
  call void @printWLine(i32* %5), !dbg !144
  ret void, !dbg !145
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_memmove_08.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_memmove_08_bad", scope: !12, file: !12, line: 37, type: !13, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_memmove_08.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 39, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !18, line: 74, baseType: !19)
!18 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!19 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!20 = !DILocation(line: 39, column: 15, scope: !11)
!21 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 40, type: !22)
!22 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 1600, elements: !23)
!23 = !{!24}
!24 = !DISubrange(count: 50)
!25 = !DILocation(line: 40, column: 13, scope: !11)
!26 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 41, type: !27)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 3200, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 100)
!30 = !DILocation(line: 41, column: 13, scope: !11)
!31 = !DILocation(line: 42, column: 8, scope: !32)
!32 = distinct !DILexicalBlock(scope: !11, file: !12, line: 42, column: 8)
!33 = !DILocation(line: 42, column: 8, scope: !11)
!34 = !DILocation(line: 46, column: 16, scope: !35)
!35 = distinct !DILexicalBlock(scope: !32, file: !12, line: 43, column: 5)
!36 = !DILocation(line: 46, column: 14, scope: !35)
!37 = !DILocation(line: 47, column: 9, scope: !35)
!38 = !DILocation(line: 47, column: 17, scope: !35)
!39 = !DILocation(line: 48, column: 5, scope: !35)
!40 = !DILocalVariable(name: "source", scope: !41, file: !12, line: 50, type: !27)
!41 = distinct !DILexicalBlock(scope: !11, file: !12, line: 49, column: 5)
!42 = !DILocation(line: 50, column: 17, scope: !41)
!43 = !DILocation(line: 51, column: 17, scope: !41)
!44 = !DILocation(line: 51, column: 9, scope: !41)
!45 = !DILocation(line: 52, column: 9, scope: !41)
!46 = !DILocation(line: 52, column: 23, scope: !41)
!47 = !DILocation(line: 54, column: 17, scope: !41)
!48 = !DILocation(line: 54, column: 9, scope: !41)
!49 = !DILocation(line: 55, column: 9, scope: !41)
!50 = !DILocation(line: 55, column: 21, scope: !41)
!51 = !DILocation(line: 56, column: 20, scope: !41)
!52 = !DILocation(line: 56, column: 9, scope: !41)
!53 = !DILocation(line: 58, column: 1, scope: !11)
!54 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_memmove_08_good", scope: !12, file: !12, line: 115, type: !13, scopeLine: 116, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!55 = !DILocation(line: 117, column: 5, scope: !54)
!56 = !DILocation(line: 118, column: 5, scope: !54)
!57 = !DILocation(line: 119, column: 1, scope: !54)
!58 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 131, type: !59, scopeLine: 132, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!59 = !DISubroutineType(types: !60)
!60 = !{!19, !19, !61}
!61 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !62, size: 64)
!62 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !63, size: 64)
!63 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!64 = !DILocalVariable(name: "argc", arg: 1, scope: !58, file: !12, line: 131, type: !19)
!65 = !DILocation(line: 131, column: 14, scope: !58)
!66 = !DILocalVariable(name: "argv", arg: 2, scope: !58, file: !12, line: 131, type: !61)
!67 = !DILocation(line: 131, column: 27, scope: !58)
!68 = !DILocation(line: 134, column: 22, scope: !58)
!69 = !DILocation(line: 134, column: 12, scope: !58)
!70 = !DILocation(line: 134, column: 5, scope: !58)
!71 = !DILocation(line: 136, column: 5, scope: !58)
!72 = !DILocation(line: 137, column: 5, scope: !58)
!73 = !DILocation(line: 138, column: 5, scope: !58)
!74 = !DILocation(line: 141, column: 5, scope: !58)
!75 = !DILocation(line: 142, column: 5, scope: !58)
!76 = !DILocation(line: 143, column: 5, scope: !58)
!77 = !DILocation(line: 145, column: 5, scope: !58)
!78 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !12, file: !12, line: 25, type: !79, scopeLine: 26, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!79 = !DISubroutineType(types: !80)
!80 = !{!19}
!81 = !DILocation(line: 27, column: 5, scope: !78)
!82 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 65, type: !13, scopeLine: 66, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!83 = !DILocalVariable(name: "data", scope: !82, file: !12, line: 67, type: !16)
!84 = !DILocation(line: 67, column: 15, scope: !82)
!85 = !DILocalVariable(name: "dataBadBuffer", scope: !82, file: !12, line: 68, type: !22)
!86 = !DILocation(line: 68, column: 13, scope: !82)
!87 = !DILocalVariable(name: "dataGoodBuffer", scope: !82, file: !12, line: 69, type: !27)
!88 = !DILocation(line: 69, column: 13, scope: !82)
!89 = !DILocation(line: 70, column: 8, scope: !90)
!90 = distinct !DILexicalBlock(scope: !82, file: !12, line: 70, column: 8)
!91 = !DILocation(line: 70, column: 8, scope: !82)
!92 = !DILocation(line: 73, column: 9, scope: !93)
!93 = distinct !DILexicalBlock(scope: !90, file: !12, line: 71, column: 5)
!94 = !DILocation(line: 74, column: 5, scope: !93)
!95 = !DILocation(line: 78, column: 16, scope: !96)
!96 = distinct !DILexicalBlock(scope: !90, file: !12, line: 76, column: 5)
!97 = !DILocation(line: 78, column: 14, scope: !96)
!98 = !DILocation(line: 79, column: 9, scope: !96)
!99 = !DILocation(line: 79, column: 17, scope: !96)
!100 = !DILocalVariable(name: "source", scope: !101, file: !12, line: 82, type: !27)
!101 = distinct !DILexicalBlock(scope: !82, file: !12, line: 81, column: 5)
!102 = !DILocation(line: 82, column: 17, scope: !101)
!103 = !DILocation(line: 83, column: 17, scope: !101)
!104 = !DILocation(line: 83, column: 9, scope: !101)
!105 = !DILocation(line: 84, column: 9, scope: !101)
!106 = !DILocation(line: 84, column: 23, scope: !101)
!107 = !DILocation(line: 86, column: 17, scope: !101)
!108 = !DILocation(line: 86, column: 9, scope: !101)
!109 = !DILocation(line: 87, column: 9, scope: !101)
!110 = !DILocation(line: 87, column: 21, scope: !101)
!111 = !DILocation(line: 88, column: 20, scope: !101)
!112 = !DILocation(line: 88, column: 9, scope: !101)
!113 = !DILocation(line: 90, column: 1, scope: !82)
!114 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !12, file: !12, line: 30, type: !79, scopeLine: 31, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!115 = !DILocation(line: 32, column: 5, scope: !114)
!116 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 93, type: !13, scopeLine: 94, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!117 = !DILocalVariable(name: "data", scope: !116, file: !12, line: 95, type: !16)
!118 = !DILocation(line: 95, column: 15, scope: !116)
!119 = !DILocalVariable(name: "dataBadBuffer", scope: !116, file: !12, line: 96, type: !22)
!120 = !DILocation(line: 96, column: 13, scope: !116)
!121 = !DILocalVariable(name: "dataGoodBuffer", scope: !116, file: !12, line: 97, type: !27)
!122 = !DILocation(line: 97, column: 13, scope: !116)
!123 = !DILocation(line: 98, column: 8, scope: !124)
!124 = distinct !DILexicalBlock(scope: !116, file: !12, line: 98, column: 8)
!125 = !DILocation(line: 98, column: 8, scope: !116)
!126 = !DILocation(line: 101, column: 16, scope: !127)
!127 = distinct !DILexicalBlock(scope: !124, file: !12, line: 99, column: 5)
!128 = !DILocation(line: 101, column: 14, scope: !127)
!129 = !DILocation(line: 102, column: 9, scope: !127)
!130 = !DILocation(line: 102, column: 17, scope: !127)
!131 = !DILocation(line: 103, column: 5, scope: !127)
!132 = !DILocalVariable(name: "source", scope: !133, file: !12, line: 105, type: !27)
!133 = distinct !DILexicalBlock(scope: !116, file: !12, line: 104, column: 5)
!134 = !DILocation(line: 105, column: 17, scope: !133)
!135 = !DILocation(line: 106, column: 17, scope: !133)
!136 = !DILocation(line: 106, column: 9, scope: !133)
!137 = !DILocation(line: 107, column: 9, scope: !133)
!138 = !DILocation(line: 107, column: 23, scope: !133)
!139 = !DILocation(line: 109, column: 17, scope: !133)
!140 = !DILocation(line: 109, column: 9, scope: !133)
!141 = !DILocation(line: 110, column: 9, scope: !133)
!142 = !DILocation(line: 110, column: 21, scope: !133)
!143 = !DILocation(line: 111, column: 20, scope: !133)
!144 = !DILocation(line: 111, column: 9, scope: !133)
!145 = !DILocation(line: 113, column: 1, scope: !116)
