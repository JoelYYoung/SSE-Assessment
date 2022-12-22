; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_ncpy_03.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_ncpy_03.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_ncpy_03_bad.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B1.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@__const.goodG2B2.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_ncpy_03_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [10 x i32], align 16
  %dataGoodBuffer = alloca [11 x i32], align 16
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !15, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata [10 x i32]* %dataBadBuffer, metadata !21, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata [11 x i32]* %dataGoodBuffer, metadata !26, metadata !DIExpression()), !dbg !30
  %arraydecay = getelementptr inbounds [10 x i32], [10 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !31
  store i32* %arraydecay, i32** %data, align 8, !dbg !34
  %0 = load i32*, i32** %data, align 8, !dbg !35
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !35
  store i32 0, i32* %arrayidx, align 4, !dbg !36
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !37, metadata !DIExpression()), !dbg !39
  %1 = bitcast [11 x i32]* %source to i8*, !dbg !39
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %1, i8* align 16 bitcast ([11 x i32]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_ncpy_03_bad.source to i8*), i64 44, i1 false), !dbg !39
  %2 = load i32*, i32** %data, align 8, !dbg !40
  %arraydecay1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !41
  %arraydecay2 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !42
  %call = call i64 @wcslen(i32* %arraydecay2) #6, !dbg !43
  %add = add i64 %call, 1, !dbg !44
  %call3 = call i32* @wcsncpy(i32* %2, i32* %arraydecay1, i64 %add) #7, !dbg !45
  %3 = load i32*, i32** %data, align 8, !dbg !46
  call void @printWLine(i32* %3), !dbg !47
  ret void, !dbg !48
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i32* @wcsncpy(i32*, i32*, i64) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #4

declare dso_local void @printWLine(i32*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_ncpy_03_good() #0 !dbg !49 {
entry:
  call void @goodG2B1(), !dbg !50
  call void @goodG2B2(), !dbg !51
  ret void, !dbg !52
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !53 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !59, metadata !DIExpression()), !dbg !60
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !61, metadata !DIExpression()), !dbg !62
  %call = call i64 @time(i64* null) #7, !dbg !63
  %conv = trunc i64 %call to i32, !dbg !64
  call void @srand(i32 %conv) #7, !dbg !65
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !66
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_ncpy_03_good(), !dbg !67
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !68
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !69
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_ncpy_03_bad(), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !71
  ret i32 0, !dbg !72
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !73 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [10 x i32], align 16
  %dataGoodBuffer = alloca [11 x i32], align 16
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !74, metadata !DIExpression()), !dbg !75
  call void @llvm.dbg.declare(metadata [10 x i32]* %dataBadBuffer, metadata !76, metadata !DIExpression()), !dbg !77
  call void @llvm.dbg.declare(metadata [11 x i32]* %dataGoodBuffer, metadata !78, metadata !DIExpression()), !dbg !79
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !80
  store i32* %arraydecay, i32** %data, align 8, !dbg !83
  %0 = load i32*, i32** %data, align 8, !dbg !84
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !84
  store i32 0, i32* %arrayidx, align 4, !dbg !85
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !86, metadata !DIExpression()), !dbg !88
  %1 = bitcast [11 x i32]* %source to i8*, !dbg !88
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %1, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B1.source to i8*), i64 44, i1 false), !dbg !88
  %2 = load i32*, i32** %data, align 8, !dbg !89
  %arraydecay1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !90
  %arraydecay2 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !91
  %call = call i64 @wcslen(i32* %arraydecay2) #6, !dbg !92
  %add = add i64 %call, 1, !dbg !93
  %call3 = call i32* @wcsncpy(i32* %2, i32* %arraydecay1, i64 %add) #7, !dbg !94
  %3 = load i32*, i32** %data, align 8, !dbg !95
  call void @printWLine(i32* %3), !dbg !96
  ret void, !dbg !97
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !98 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [10 x i32], align 16
  %dataGoodBuffer = alloca [11 x i32], align 16
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !99, metadata !DIExpression()), !dbg !100
  call void @llvm.dbg.declare(metadata [10 x i32]* %dataBadBuffer, metadata !101, metadata !DIExpression()), !dbg !102
  call void @llvm.dbg.declare(metadata [11 x i32]* %dataGoodBuffer, metadata !103, metadata !DIExpression()), !dbg !104
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !105
  store i32* %arraydecay, i32** %data, align 8, !dbg !108
  %0 = load i32*, i32** %data, align 8, !dbg !109
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !109
  store i32 0, i32* %arrayidx, align 4, !dbg !110
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !111, metadata !DIExpression()), !dbg !113
  %1 = bitcast [11 x i32]* %source to i8*, !dbg !113
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %1, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B2.source to i8*), i64 44, i1 false), !dbg !113
  %2 = load i32*, i32** %data, align 8, !dbg !114
  %arraydecay1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !115
  %arraydecay2 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !116
  %call = call i64 @wcslen(i32* %arraydecay2) #6, !dbg !117
  %add = add i64 %call, 1, !dbg !118
  %call3 = call i32* @wcsncpy(i32* %2, i32* %arraydecay1, i64 %add) #7, !dbg !119
  %3 = load i32*, i32** %data, align 8, !dbg !120
  call void @printWLine(i32* %3), !dbg !121
  ret void, !dbg !122
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_ncpy_03.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_ncpy_03_bad", scope: !12, file: !12, line: 28, type: !13, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_ncpy_03.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 30, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !18, line: 74, baseType: !19)
!18 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!19 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!20 = !DILocation(line: 30, column: 15, scope: !11)
!21 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 31, type: !22)
!22 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 320, elements: !23)
!23 = !{!24}
!24 = !DISubrange(count: 10)
!25 = !DILocation(line: 31, column: 13, scope: !11)
!26 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 32, type: !27)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 352, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 11)
!30 = !DILocation(line: 32, column: 13, scope: !11)
!31 = !DILocation(line: 37, column: 16, scope: !32)
!32 = distinct !DILexicalBlock(scope: !33, file: !12, line: 34, column: 5)
!33 = distinct !DILexicalBlock(scope: !11, file: !12, line: 33, column: 8)
!34 = !DILocation(line: 37, column: 14, scope: !32)
!35 = !DILocation(line: 38, column: 9, scope: !32)
!36 = !DILocation(line: 38, column: 17, scope: !32)
!37 = !DILocalVariable(name: "source", scope: !38, file: !12, line: 41, type: !27)
!38 = distinct !DILexicalBlock(scope: !11, file: !12, line: 40, column: 5)
!39 = !DILocation(line: 41, column: 17, scope: !38)
!40 = !DILocation(line: 44, column: 17, scope: !38)
!41 = !DILocation(line: 44, column: 23, scope: !38)
!42 = !DILocation(line: 44, column: 38, scope: !38)
!43 = !DILocation(line: 44, column: 31, scope: !38)
!44 = !DILocation(line: 44, column: 46, scope: !38)
!45 = !DILocation(line: 44, column: 9, scope: !38)
!46 = !DILocation(line: 45, column: 20, scope: !38)
!47 = !DILocation(line: 45, column: 9, scope: !38)
!48 = !DILocation(line: 47, column: 1, scope: !11)
!49 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_ncpy_03_good", scope: !12, file: !12, line: 102, type: !13, scopeLine: 103, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!50 = !DILocation(line: 104, column: 5, scope: !49)
!51 = !DILocation(line: 105, column: 5, scope: !49)
!52 = !DILocation(line: 106, column: 1, scope: !49)
!53 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 118, type: !54, scopeLine: 119, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!54 = !DISubroutineType(types: !55)
!55 = !{!19, !19, !56}
!56 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !57, size: 64)
!57 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !58, size: 64)
!58 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!59 = !DILocalVariable(name: "argc", arg: 1, scope: !53, file: !12, line: 118, type: !19)
!60 = !DILocation(line: 118, column: 14, scope: !53)
!61 = !DILocalVariable(name: "argv", arg: 2, scope: !53, file: !12, line: 118, type: !56)
!62 = !DILocation(line: 118, column: 27, scope: !53)
!63 = !DILocation(line: 121, column: 22, scope: !53)
!64 = !DILocation(line: 121, column: 12, scope: !53)
!65 = !DILocation(line: 121, column: 5, scope: !53)
!66 = !DILocation(line: 123, column: 5, scope: !53)
!67 = !DILocation(line: 124, column: 5, scope: !53)
!68 = !DILocation(line: 125, column: 5, scope: !53)
!69 = !DILocation(line: 128, column: 5, scope: !53)
!70 = !DILocation(line: 129, column: 5, scope: !53)
!71 = !DILocation(line: 130, column: 5, scope: !53)
!72 = !DILocation(line: 132, column: 5, scope: !53)
!73 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 54, type: !13, scopeLine: 55, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!74 = !DILocalVariable(name: "data", scope: !73, file: !12, line: 56, type: !16)
!75 = !DILocation(line: 56, column: 15, scope: !73)
!76 = !DILocalVariable(name: "dataBadBuffer", scope: !73, file: !12, line: 57, type: !22)
!77 = !DILocation(line: 57, column: 13, scope: !73)
!78 = !DILocalVariable(name: "dataGoodBuffer", scope: !73, file: !12, line: 58, type: !27)
!79 = !DILocation(line: 58, column: 13, scope: !73)
!80 = !DILocation(line: 68, column: 16, scope: !81)
!81 = distinct !DILexicalBlock(scope: !82, file: !12, line: 65, column: 5)
!82 = distinct !DILexicalBlock(scope: !73, file: !12, line: 59, column: 8)
!83 = !DILocation(line: 68, column: 14, scope: !81)
!84 = !DILocation(line: 69, column: 9, scope: !81)
!85 = !DILocation(line: 69, column: 17, scope: !81)
!86 = !DILocalVariable(name: "source", scope: !87, file: !12, line: 72, type: !27)
!87 = distinct !DILexicalBlock(scope: !73, file: !12, line: 71, column: 5)
!88 = !DILocation(line: 72, column: 17, scope: !87)
!89 = !DILocation(line: 75, column: 17, scope: !87)
!90 = !DILocation(line: 75, column: 23, scope: !87)
!91 = !DILocation(line: 75, column: 38, scope: !87)
!92 = !DILocation(line: 75, column: 31, scope: !87)
!93 = !DILocation(line: 75, column: 46, scope: !87)
!94 = !DILocation(line: 75, column: 9, scope: !87)
!95 = !DILocation(line: 76, column: 20, scope: !87)
!96 = !DILocation(line: 76, column: 9, scope: !87)
!97 = !DILocation(line: 78, column: 1, scope: !73)
!98 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 81, type: !13, scopeLine: 82, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!99 = !DILocalVariable(name: "data", scope: !98, file: !12, line: 83, type: !16)
!100 = !DILocation(line: 83, column: 15, scope: !98)
!101 = !DILocalVariable(name: "dataBadBuffer", scope: !98, file: !12, line: 84, type: !22)
!102 = !DILocation(line: 84, column: 13, scope: !98)
!103 = !DILocalVariable(name: "dataGoodBuffer", scope: !98, file: !12, line: 85, type: !27)
!104 = !DILocation(line: 85, column: 13, scope: !98)
!105 = !DILocation(line: 90, column: 16, scope: !106)
!106 = distinct !DILexicalBlock(scope: !107, file: !12, line: 87, column: 5)
!107 = distinct !DILexicalBlock(scope: !98, file: !12, line: 86, column: 8)
!108 = !DILocation(line: 90, column: 14, scope: !106)
!109 = !DILocation(line: 91, column: 9, scope: !106)
!110 = !DILocation(line: 91, column: 17, scope: !106)
!111 = !DILocalVariable(name: "source", scope: !112, file: !12, line: 94, type: !27)
!112 = distinct !DILexicalBlock(scope: !98, file: !12, line: 93, column: 5)
!113 = !DILocation(line: 94, column: 17, scope: !112)
!114 = !DILocation(line: 97, column: 17, scope: !112)
!115 = !DILocation(line: 97, column: 23, scope: !112)
!116 = !DILocation(line: 97, column: 38, scope: !112)
!117 = !DILocation(line: 97, column: 31, scope: !112)
!118 = !DILocation(line: 97, column: 46, scope: !112)
!119 = !DILocation(line: 97, column: 9, scope: !112)
!120 = !DILocation(line: 98, column: 20, scope: !112)
!121 = !DILocation(line: 98, column: 9, scope: !112)
!122 = !DILocation(line: 100, column: 1, scope: !98)
