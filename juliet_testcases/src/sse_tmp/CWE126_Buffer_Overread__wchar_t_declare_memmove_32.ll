; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_declare_memmove_32.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_declare_memmove_32.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__wchar_t_declare_memmove_32_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %dataPtr1 = alloca i32**, align 8
  %dataPtr2 = alloca i32**, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %data4 = alloca i32*, align 8
  %data6 = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !15, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i32*** %dataPtr1, metadata !21, metadata !DIExpression()), !dbg !23
  store i32** %data, i32*** %dataPtr1, align 8, !dbg !23
  call void @llvm.dbg.declare(metadata i32*** %dataPtr2, metadata !24, metadata !DIExpression()), !dbg !25
  store i32** %data, i32*** %dataPtr2, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !26, metadata !DIExpression()), !dbg !30
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !31, metadata !DIExpression()), !dbg !35
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !36
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 49) #6, !dbg !37
  %arrayidx = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 49, !dbg !38
  store i32 0, i32* %arrayidx, align 4, !dbg !39
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !40
  %call2 = call i32* @wmemset(i32* %arraydecay1, i32 65, i64 99) #6, !dbg !41
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 99, !dbg !42
  store i32 0, i32* %arrayidx3, align 4, !dbg !43
  call void @llvm.dbg.declare(metadata i32** %data4, metadata !44, metadata !DIExpression()), !dbg !46
  %0 = load i32**, i32*** %dataPtr1, align 8, !dbg !47
  %1 = load i32*, i32** %0, align 8, !dbg !48
  store i32* %1, i32** %data4, align 8, !dbg !46
  %arraydecay5 = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !49
  store i32* %arraydecay5, i32** %data4, align 8, !dbg !50
  %2 = load i32*, i32** %data4, align 8, !dbg !51
  %3 = load i32**, i32*** %dataPtr1, align 8, !dbg !52
  store i32* %2, i32** %3, align 8, !dbg !53
  call void @llvm.dbg.declare(metadata i32** %data6, metadata !54, metadata !DIExpression()), !dbg !56
  %4 = load i32**, i32*** %dataPtr2, align 8, !dbg !57
  %5 = load i32*, i32** %4, align 8, !dbg !58
  store i32* %5, i32** %data6, align 8, !dbg !56
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !59, metadata !DIExpression()), !dbg !61
  %arraydecay7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !62
  %call8 = call i32* @wmemset(i32* %arraydecay7, i32 67, i64 99) #6, !dbg !63
  %arrayidx9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !64
  store i32 0, i32* %arrayidx9, align 4, !dbg !65
  %arraydecay10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !66
  %6 = bitcast i32* %arraydecay10 to i8*, !dbg !66
  %7 = load i32*, i32** %data6, align 8, !dbg !67
  %8 = bitcast i32* %7 to i8*, !dbg !66
  %arraydecay11 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !68
  %call12 = call i64 @wcslen(i32* %arraydecay11) #7, !dbg !69
  %mul = mul i64 %call12, 4, !dbg !70
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %6, i8* align 4 %8, i64 %mul, i1 false), !dbg !66
  %arrayidx13 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !71
  store i32 0, i32* %arrayidx13, align 4, !dbg !72
  %arraydecay14 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !73
  call void @printWLine(i32* %arraydecay14), !dbg !74
  ret void, !dbg !75
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #3

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #4

declare dso_local void @printWLine(i32*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__wchar_t_declare_memmove_32_good() #0 !dbg !76 {
entry:
  call void @goodG2B(), !dbg !77
  ret void, !dbg !78
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !79 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !85, metadata !DIExpression()), !dbg !86
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !87, metadata !DIExpression()), !dbg !88
  %call = call i64 @time(i64* null) #6, !dbg !89
  %conv = trunc i64 %call to i32, !dbg !90
  call void @srand(i32 %conv) #6, !dbg !91
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !92
  call void @CWE126_Buffer_Overread__wchar_t_declare_memmove_32_good(), !dbg !93
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !94
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !95
  call void @CWE126_Buffer_Overread__wchar_t_declare_memmove_32_bad(), !dbg !96
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !97
  ret i32 0, !dbg !98
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !99 {
entry:
  %data = alloca i32*, align 8
  %dataPtr1 = alloca i32**, align 8
  %dataPtr2 = alloca i32**, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %data4 = alloca i32*, align 8
  %data6 = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !100, metadata !DIExpression()), !dbg !101
  call void @llvm.dbg.declare(metadata i32*** %dataPtr1, metadata !102, metadata !DIExpression()), !dbg !103
  store i32** %data, i32*** %dataPtr1, align 8, !dbg !103
  call void @llvm.dbg.declare(metadata i32*** %dataPtr2, metadata !104, metadata !DIExpression()), !dbg !105
  store i32** %data, i32*** %dataPtr2, align 8, !dbg !105
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !106, metadata !DIExpression()), !dbg !107
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !108, metadata !DIExpression()), !dbg !109
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !110
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 49) #6, !dbg !111
  %arrayidx = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 49, !dbg !112
  store i32 0, i32* %arrayidx, align 4, !dbg !113
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !114
  %call2 = call i32* @wmemset(i32* %arraydecay1, i32 65, i64 99) #6, !dbg !115
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 99, !dbg !116
  store i32 0, i32* %arrayidx3, align 4, !dbg !117
  call void @llvm.dbg.declare(metadata i32** %data4, metadata !118, metadata !DIExpression()), !dbg !120
  %0 = load i32**, i32*** %dataPtr1, align 8, !dbg !121
  %1 = load i32*, i32** %0, align 8, !dbg !122
  store i32* %1, i32** %data4, align 8, !dbg !120
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !123
  store i32* %arraydecay5, i32** %data4, align 8, !dbg !124
  %2 = load i32*, i32** %data4, align 8, !dbg !125
  %3 = load i32**, i32*** %dataPtr1, align 8, !dbg !126
  store i32* %2, i32** %3, align 8, !dbg !127
  call void @llvm.dbg.declare(metadata i32** %data6, metadata !128, metadata !DIExpression()), !dbg !130
  %4 = load i32**, i32*** %dataPtr2, align 8, !dbg !131
  %5 = load i32*, i32** %4, align 8, !dbg !132
  store i32* %5, i32** %data6, align 8, !dbg !130
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !133, metadata !DIExpression()), !dbg !135
  %arraydecay7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !136
  %call8 = call i32* @wmemset(i32* %arraydecay7, i32 67, i64 99) #6, !dbg !137
  %arrayidx9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !138
  store i32 0, i32* %arrayidx9, align 4, !dbg !139
  %arraydecay10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !140
  %6 = bitcast i32* %arraydecay10 to i8*, !dbg !140
  %7 = load i32*, i32** %data6, align 8, !dbg !141
  %8 = bitcast i32* %7 to i8*, !dbg !140
  %arraydecay11 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !142
  %call12 = call i64 @wcslen(i32* %arraydecay11) #7, !dbg !143
  %mul = mul i64 %call12, 4, !dbg !144
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %6, i8* align 4 %8, i64 %mul, i1 false), !dbg !140
  %arrayidx13 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !145
  store i32 0, i32* %arrayidx13, align 4, !dbg !146
  %arraydecay14 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !147
  call void @printWLine(i32* %arraydecay14), !dbg !148
  ret void, !dbg !149
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_declare_memmove_32.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_declare_memmove_32_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_declare_memmove_32.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 25, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !18, line: 74, baseType: !19)
!18 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!19 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!20 = !DILocation(line: 25, column: 15, scope: !11)
!21 = !DILocalVariable(name: "dataPtr1", scope: !11, file: !12, line: 26, type: !22)
!22 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!23 = !DILocation(line: 26, column: 16, scope: !11)
!24 = !DILocalVariable(name: "dataPtr2", scope: !11, file: !12, line: 27, type: !22)
!25 = !DILocation(line: 27, column: 16, scope: !11)
!26 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 28, type: !27)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 1600, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 50)
!30 = !DILocation(line: 28, column: 13, scope: !11)
!31 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 29, type: !32)
!32 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 3200, elements: !33)
!33 = !{!34}
!34 = !DISubrange(count: 100)
!35 = !DILocation(line: 29, column: 13, scope: !11)
!36 = !DILocation(line: 30, column: 13, scope: !11)
!37 = !DILocation(line: 30, column: 5, scope: !11)
!38 = !DILocation(line: 31, column: 5, scope: !11)
!39 = !DILocation(line: 31, column: 25, scope: !11)
!40 = !DILocation(line: 32, column: 13, scope: !11)
!41 = !DILocation(line: 32, column: 5, scope: !11)
!42 = !DILocation(line: 33, column: 5, scope: !11)
!43 = !DILocation(line: 33, column: 27, scope: !11)
!44 = !DILocalVariable(name: "data", scope: !45, file: !12, line: 35, type: !16)
!45 = distinct !DILexicalBlock(scope: !11, file: !12, line: 34, column: 5)
!46 = !DILocation(line: 35, column: 19, scope: !45)
!47 = !DILocation(line: 35, column: 27, scope: !45)
!48 = !DILocation(line: 35, column: 26, scope: !45)
!49 = !DILocation(line: 37, column: 16, scope: !45)
!50 = !DILocation(line: 37, column: 14, scope: !45)
!51 = !DILocation(line: 38, column: 21, scope: !45)
!52 = !DILocation(line: 38, column: 10, scope: !45)
!53 = !DILocation(line: 38, column: 19, scope: !45)
!54 = !DILocalVariable(name: "data", scope: !55, file: !12, line: 41, type: !16)
!55 = distinct !DILexicalBlock(scope: !11, file: !12, line: 40, column: 5)
!56 = !DILocation(line: 41, column: 19, scope: !55)
!57 = !DILocation(line: 41, column: 27, scope: !55)
!58 = !DILocation(line: 41, column: 26, scope: !55)
!59 = !DILocalVariable(name: "dest", scope: !60, file: !12, line: 43, type: !32)
!60 = distinct !DILexicalBlock(scope: !55, file: !12, line: 42, column: 9)
!61 = !DILocation(line: 43, column: 21, scope: !60)
!62 = !DILocation(line: 44, column: 21, scope: !60)
!63 = !DILocation(line: 44, column: 13, scope: !60)
!64 = !DILocation(line: 45, column: 13, scope: !60)
!65 = !DILocation(line: 45, column: 25, scope: !60)
!66 = !DILocation(line: 48, column: 13, scope: !60)
!67 = !DILocation(line: 48, column: 27, scope: !60)
!68 = !DILocation(line: 48, column: 40, scope: !60)
!69 = !DILocation(line: 48, column: 33, scope: !60)
!70 = !DILocation(line: 48, column: 45, scope: !60)
!71 = !DILocation(line: 49, column: 13, scope: !60)
!72 = !DILocation(line: 49, column: 25, scope: !60)
!73 = !DILocation(line: 50, column: 24, scope: !60)
!74 = !DILocation(line: 50, column: 13, scope: !60)
!75 = !DILocation(line: 53, column: 1, scope: !11)
!76 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_declare_memmove_32_good", scope: !12, file: !12, line: 92, type: !13, scopeLine: 93, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!77 = !DILocation(line: 94, column: 5, scope: !76)
!78 = !DILocation(line: 95, column: 1, scope: !76)
!79 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 106, type: !80, scopeLine: 107, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!80 = !DISubroutineType(types: !81)
!81 = !{!19, !19, !82}
!82 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !83, size: 64)
!83 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !84, size: 64)
!84 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!85 = !DILocalVariable(name: "argc", arg: 1, scope: !79, file: !12, line: 106, type: !19)
!86 = !DILocation(line: 106, column: 14, scope: !79)
!87 = !DILocalVariable(name: "argv", arg: 2, scope: !79, file: !12, line: 106, type: !82)
!88 = !DILocation(line: 106, column: 27, scope: !79)
!89 = !DILocation(line: 109, column: 22, scope: !79)
!90 = !DILocation(line: 109, column: 12, scope: !79)
!91 = !DILocation(line: 109, column: 5, scope: !79)
!92 = !DILocation(line: 111, column: 5, scope: !79)
!93 = !DILocation(line: 112, column: 5, scope: !79)
!94 = !DILocation(line: 113, column: 5, scope: !79)
!95 = !DILocation(line: 116, column: 5, scope: !79)
!96 = !DILocation(line: 117, column: 5, scope: !79)
!97 = !DILocation(line: 118, column: 5, scope: !79)
!98 = !DILocation(line: 120, column: 5, scope: !79)
!99 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 60, type: !13, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!100 = !DILocalVariable(name: "data", scope: !99, file: !12, line: 62, type: !16)
!101 = !DILocation(line: 62, column: 15, scope: !99)
!102 = !DILocalVariable(name: "dataPtr1", scope: !99, file: !12, line: 63, type: !22)
!103 = !DILocation(line: 63, column: 16, scope: !99)
!104 = !DILocalVariable(name: "dataPtr2", scope: !99, file: !12, line: 64, type: !22)
!105 = !DILocation(line: 64, column: 16, scope: !99)
!106 = !DILocalVariable(name: "dataBadBuffer", scope: !99, file: !12, line: 65, type: !27)
!107 = !DILocation(line: 65, column: 13, scope: !99)
!108 = !DILocalVariable(name: "dataGoodBuffer", scope: !99, file: !12, line: 66, type: !32)
!109 = !DILocation(line: 66, column: 13, scope: !99)
!110 = !DILocation(line: 67, column: 13, scope: !99)
!111 = !DILocation(line: 67, column: 5, scope: !99)
!112 = !DILocation(line: 68, column: 5, scope: !99)
!113 = !DILocation(line: 68, column: 25, scope: !99)
!114 = !DILocation(line: 69, column: 13, scope: !99)
!115 = !DILocation(line: 69, column: 5, scope: !99)
!116 = !DILocation(line: 70, column: 5, scope: !99)
!117 = !DILocation(line: 70, column: 27, scope: !99)
!118 = !DILocalVariable(name: "data", scope: !119, file: !12, line: 72, type: !16)
!119 = distinct !DILexicalBlock(scope: !99, file: !12, line: 71, column: 5)
!120 = !DILocation(line: 72, column: 19, scope: !119)
!121 = !DILocation(line: 72, column: 27, scope: !119)
!122 = !DILocation(line: 72, column: 26, scope: !119)
!123 = !DILocation(line: 74, column: 16, scope: !119)
!124 = !DILocation(line: 74, column: 14, scope: !119)
!125 = !DILocation(line: 75, column: 21, scope: !119)
!126 = !DILocation(line: 75, column: 10, scope: !119)
!127 = !DILocation(line: 75, column: 19, scope: !119)
!128 = !DILocalVariable(name: "data", scope: !129, file: !12, line: 78, type: !16)
!129 = distinct !DILexicalBlock(scope: !99, file: !12, line: 77, column: 5)
!130 = !DILocation(line: 78, column: 19, scope: !129)
!131 = !DILocation(line: 78, column: 27, scope: !129)
!132 = !DILocation(line: 78, column: 26, scope: !129)
!133 = !DILocalVariable(name: "dest", scope: !134, file: !12, line: 80, type: !32)
!134 = distinct !DILexicalBlock(scope: !129, file: !12, line: 79, column: 9)
!135 = !DILocation(line: 80, column: 21, scope: !134)
!136 = !DILocation(line: 81, column: 21, scope: !134)
!137 = !DILocation(line: 81, column: 13, scope: !134)
!138 = !DILocation(line: 82, column: 13, scope: !134)
!139 = !DILocation(line: 82, column: 25, scope: !134)
!140 = !DILocation(line: 85, column: 13, scope: !134)
!141 = !DILocation(line: 85, column: 27, scope: !134)
!142 = !DILocation(line: 85, column: 40, scope: !134)
!143 = !DILocation(line: 85, column: 33, scope: !134)
!144 = !DILocation(line: 85, column: 45, scope: !134)
!145 = !DILocation(line: 86, column: 13, scope: !134)
!146 = !DILocation(line: 86, column: 25, scope: !134)
!147 = !DILocation(line: 87, column: 24, scope: !134)
!148 = !DILocation(line: 87, column: 13, scope: !134)
!149 = !DILocation(line: 90, column: 1, scope: !99)
