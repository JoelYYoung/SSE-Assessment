; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_declare_memcpy_15.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_declare_memcpy_15.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__wchar_t_declare_memcpy_15_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !15, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !21, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !26, metadata !DIExpression()), !dbg !30
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !31
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 49) #6, !dbg !32
  %arrayidx = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 49, !dbg !33
  store i32 0, i32* %arrayidx, align 4, !dbg !34
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !35
  %call2 = call i32* @wmemset(i32* %arraydecay1, i32 65, i64 99) #6, !dbg !36
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 99, !dbg !37
  store i32 0, i32* %arrayidx3, align 4, !dbg !38
  %arraydecay4 = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !39
  store i32* %arraydecay4, i32** %data, align 8, !dbg !40
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !41, metadata !DIExpression()), !dbg !43
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !44
  %call6 = call i32* @wmemset(i32* %arraydecay5, i32 67, i64 99) #6, !dbg !45
  %arrayidx7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !46
  store i32 0, i32* %arrayidx7, align 4, !dbg !47
  %arraydecay8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !48
  %0 = bitcast i32* %arraydecay8 to i8*, !dbg !48
  %1 = load i32*, i32** %data, align 8, !dbg !49
  %2 = bitcast i32* %1 to i8*, !dbg !48
  %arraydecay9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !50
  %call10 = call i64 @wcslen(i32* %arraydecay9) #7, !dbg !51
  %mul = mul i64 %call10, 4, !dbg !52
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %0, i8* align 4 %2, i64 %mul, i1 false), !dbg !48
  %arrayidx11 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !53
  store i32 0, i32* %arrayidx11, align 4, !dbg !54
  %arraydecay12 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !55
  call void @printWLine(i32* %arraydecay12), !dbg !56
  ret void, !dbg !57
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #3

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

declare dso_local void @printWLine(i32*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__wchar_t_declare_memcpy_15_good() #0 !dbg !58 {
entry:
  call void @goodG2B1(), !dbg !59
  call void @goodG2B2(), !dbg !60
  ret void, !dbg !61
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !62 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !68, metadata !DIExpression()), !dbg !69
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !70, metadata !DIExpression()), !dbg !71
  %call = call i64 @time(i64* null) #6, !dbg !72
  %conv = trunc i64 %call to i32, !dbg !73
  call void @srand(i32 %conv) #6, !dbg !74
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !75
  call void @CWE126_Buffer_Overread__wchar_t_declare_memcpy_15_good(), !dbg !76
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !77
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !78
  call void @CWE126_Buffer_Overread__wchar_t_declare_memcpy_15_bad(), !dbg !79
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !80
  ret i32 0, !dbg !81
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !82 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !83, metadata !DIExpression()), !dbg !84
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !85, metadata !DIExpression()), !dbg !86
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !87, metadata !DIExpression()), !dbg !88
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !89
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 49) #6, !dbg !90
  %arrayidx = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 49, !dbg !91
  store i32 0, i32* %arrayidx, align 4, !dbg !92
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !93
  %call2 = call i32* @wmemset(i32* %arraydecay1, i32 65, i64 99) #6, !dbg !94
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 99, !dbg !95
  store i32 0, i32* %arrayidx3, align 4, !dbg !96
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !97
  store i32* %arraydecay4, i32** %data, align 8, !dbg !98
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !99, metadata !DIExpression()), !dbg !101
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !102
  %call6 = call i32* @wmemset(i32* %arraydecay5, i32 67, i64 99) #6, !dbg !103
  %arrayidx7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !104
  store i32 0, i32* %arrayidx7, align 4, !dbg !105
  %arraydecay8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !106
  %0 = bitcast i32* %arraydecay8 to i8*, !dbg !106
  %1 = load i32*, i32** %data, align 8, !dbg !107
  %2 = bitcast i32* %1 to i8*, !dbg !106
  %arraydecay9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !108
  %call10 = call i64 @wcslen(i32* %arraydecay9) #7, !dbg !109
  %mul = mul i64 %call10, 4, !dbg !110
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %0, i8* align 4 %2, i64 %mul, i1 false), !dbg !106
  %arrayidx11 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !111
  store i32 0, i32* %arrayidx11, align 4, !dbg !112
  %arraydecay12 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !113
  call void @printWLine(i32* %arraydecay12), !dbg !114
  ret void, !dbg !115
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !116 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !117, metadata !DIExpression()), !dbg !118
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !119, metadata !DIExpression()), !dbg !120
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !121, metadata !DIExpression()), !dbg !122
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !123
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 49) #6, !dbg !124
  %arrayidx = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 49, !dbg !125
  store i32 0, i32* %arrayidx, align 4, !dbg !126
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !127
  %call2 = call i32* @wmemset(i32* %arraydecay1, i32 65, i64 99) #6, !dbg !128
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 99, !dbg !129
  store i32 0, i32* %arrayidx3, align 4, !dbg !130
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !131
  store i32* %arraydecay4, i32** %data, align 8, !dbg !132
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !133, metadata !DIExpression()), !dbg !135
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !136
  %call6 = call i32* @wmemset(i32* %arraydecay5, i32 67, i64 99) #6, !dbg !137
  %arrayidx7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !138
  store i32 0, i32* %arrayidx7, align 4, !dbg !139
  %arraydecay8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !140
  %0 = bitcast i32* %arraydecay8 to i8*, !dbg !140
  %1 = load i32*, i32** %data, align 8, !dbg !141
  %2 = bitcast i32* %1 to i8*, !dbg !140
  %arraydecay9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !142
  %call10 = call i64 @wcslen(i32* %arraydecay9) #7, !dbg !143
  %mul = mul i64 %call10, 4, !dbg !144
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %0, i8* align 4 %2, i64 %mul, i1 false), !dbg !140
  %arrayidx11 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !145
  store i32 0, i32* %arrayidx11, align 4, !dbg !146
  %arraydecay12 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !147
  call void @printWLine(i32* %arraydecay12), !dbg !148
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_declare_memcpy_15.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_declare_memcpy_15_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_declare_memcpy_15.c", directory: "/home/joelyang/SSE-Assessment")
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
!31 = !DILocation(line: 28, column: 13, scope: !11)
!32 = !DILocation(line: 28, column: 5, scope: !11)
!33 = !DILocation(line: 29, column: 5, scope: !11)
!34 = !DILocation(line: 29, column: 25, scope: !11)
!35 = !DILocation(line: 30, column: 13, scope: !11)
!36 = !DILocation(line: 30, column: 5, scope: !11)
!37 = !DILocation(line: 31, column: 5, scope: !11)
!38 = !DILocation(line: 31, column: 27, scope: !11)
!39 = !DILocation(line: 36, column: 16, scope: !11)
!40 = !DILocation(line: 36, column: 14, scope: !11)
!41 = !DILocalVariable(name: "dest", scope: !42, file: !12, line: 44, type: !27)
!42 = distinct !DILexicalBlock(scope: !11, file: !12, line: 43, column: 5)
!43 = !DILocation(line: 44, column: 17, scope: !42)
!44 = !DILocation(line: 45, column: 17, scope: !42)
!45 = !DILocation(line: 45, column: 9, scope: !42)
!46 = !DILocation(line: 46, column: 9, scope: !42)
!47 = !DILocation(line: 46, column: 21, scope: !42)
!48 = !DILocation(line: 49, column: 9, scope: !42)
!49 = !DILocation(line: 49, column: 22, scope: !42)
!50 = !DILocation(line: 49, column: 35, scope: !42)
!51 = !DILocation(line: 49, column: 28, scope: !42)
!52 = !DILocation(line: 49, column: 40, scope: !42)
!53 = !DILocation(line: 50, column: 9, scope: !42)
!54 = !DILocation(line: 50, column: 21, scope: !42)
!55 = !DILocation(line: 51, column: 20, scope: !42)
!56 = !DILocation(line: 51, column: 9, scope: !42)
!57 = !DILocation(line: 53, column: 1, scope: !11)
!58 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_declare_memcpy_15_good", scope: !12, file: !12, line: 125, type: !13, scopeLine: 126, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!59 = !DILocation(line: 127, column: 5, scope: !58)
!60 = !DILocation(line: 128, column: 5, scope: !58)
!61 = !DILocation(line: 129, column: 1, scope: !58)
!62 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 141, type: !63, scopeLine: 142, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!63 = !DISubroutineType(types: !64)
!64 = !{!19, !19, !65}
!65 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !66, size: 64)
!66 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !67, size: 64)
!67 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!68 = !DILocalVariable(name: "argc", arg: 1, scope: !62, file: !12, line: 141, type: !19)
!69 = !DILocation(line: 141, column: 14, scope: !62)
!70 = !DILocalVariable(name: "argv", arg: 2, scope: !62, file: !12, line: 141, type: !65)
!71 = !DILocation(line: 141, column: 27, scope: !62)
!72 = !DILocation(line: 144, column: 22, scope: !62)
!73 = !DILocation(line: 144, column: 12, scope: !62)
!74 = !DILocation(line: 144, column: 5, scope: !62)
!75 = !DILocation(line: 146, column: 5, scope: !62)
!76 = !DILocation(line: 147, column: 5, scope: !62)
!77 = !DILocation(line: 148, column: 5, scope: !62)
!78 = !DILocation(line: 151, column: 5, scope: !62)
!79 = !DILocation(line: 152, column: 5, scope: !62)
!80 = !DILocation(line: 153, column: 5, scope: !62)
!81 = !DILocation(line: 155, column: 5, scope: !62)
!82 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 60, type: !13, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!83 = !DILocalVariable(name: "data", scope: !82, file: !12, line: 62, type: !16)
!84 = !DILocation(line: 62, column: 15, scope: !82)
!85 = !DILocalVariable(name: "dataBadBuffer", scope: !82, file: !12, line: 63, type: !22)
!86 = !DILocation(line: 63, column: 13, scope: !82)
!87 = !DILocalVariable(name: "dataGoodBuffer", scope: !82, file: !12, line: 64, type: !27)
!88 = !DILocation(line: 64, column: 13, scope: !82)
!89 = !DILocation(line: 65, column: 13, scope: !82)
!90 = !DILocation(line: 65, column: 5, scope: !82)
!91 = !DILocation(line: 66, column: 5, scope: !82)
!92 = !DILocation(line: 66, column: 25, scope: !82)
!93 = !DILocation(line: 67, column: 13, scope: !82)
!94 = !DILocation(line: 67, column: 5, scope: !82)
!95 = !DILocation(line: 68, column: 5, scope: !82)
!96 = !DILocation(line: 68, column: 27, scope: !82)
!97 = !DILocation(line: 77, column: 16, scope: !82)
!98 = !DILocation(line: 77, column: 14, scope: !82)
!99 = !DILocalVariable(name: "dest", scope: !100, file: !12, line: 81, type: !27)
!100 = distinct !DILexicalBlock(scope: !82, file: !12, line: 80, column: 5)
!101 = !DILocation(line: 81, column: 17, scope: !100)
!102 = !DILocation(line: 82, column: 17, scope: !100)
!103 = !DILocation(line: 82, column: 9, scope: !100)
!104 = !DILocation(line: 83, column: 9, scope: !100)
!105 = !DILocation(line: 83, column: 21, scope: !100)
!106 = !DILocation(line: 86, column: 9, scope: !100)
!107 = !DILocation(line: 86, column: 22, scope: !100)
!108 = !DILocation(line: 86, column: 35, scope: !100)
!109 = !DILocation(line: 86, column: 28, scope: !100)
!110 = !DILocation(line: 86, column: 40, scope: !100)
!111 = !DILocation(line: 87, column: 9, scope: !100)
!112 = !DILocation(line: 87, column: 21, scope: !100)
!113 = !DILocation(line: 88, column: 20, scope: !100)
!114 = !DILocation(line: 88, column: 9, scope: !100)
!115 = !DILocation(line: 90, column: 1, scope: !82)
!116 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 93, type: !13, scopeLine: 94, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!117 = !DILocalVariable(name: "data", scope: !116, file: !12, line: 95, type: !16)
!118 = !DILocation(line: 95, column: 15, scope: !116)
!119 = !DILocalVariable(name: "dataBadBuffer", scope: !116, file: !12, line: 96, type: !22)
!120 = !DILocation(line: 96, column: 13, scope: !116)
!121 = !DILocalVariable(name: "dataGoodBuffer", scope: !116, file: !12, line: 97, type: !27)
!122 = !DILocation(line: 97, column: 13, scope: !116)
!123 = !DILocation(line: 98, column: 13, scope: !116)
!124 = !DILocation(line: 98, column: 5, scope: !116)
!125 = !DILocation(line: 99, column: 5, scope: !116)
!126 = !DILocation(line: 99, column: 25, scope: !116)
!127 = !DILocation(line: 100, column: 13, scope: !116)
!128 = !DILocation(line: 100, column: 5, scope: !116)
!129 = !DILocation(line: 101, column: 5, scope: !116)
!130 = !DILocation(line: 101, column: 27, scope: !116)
!131 = !DILocation(line: 106, column: 16, scope: !116)
!132 = !DILocation(line: 106, column: 14, scope: !116)
!133 = !DILocalVariable(name: "dest", scope: !134, file: !12, line: 114, type: !27)
!134 = distinct !DILexicalBlock(scope: !116, file: !12, line: 113, column: 5)
!135 = !DILocation(line: 114, column: 17, scope: !134)
!136 = !DILocation(line: 115, column: 17, scope: !134)
!137 = !DILocation(line: 115, column: 9, scope: !134)
!138 = !DILocation(line: 116, column: 9, scope: !134)
!139 = !DILocation(line: 116, column: 21, scope: !134)
!140 = !DILocation(line: 119, column: 9, scope: !134)
!141 = !DILocation(line: 119, column: 22, scope: !134)
!142 = !DILocation(line: 119, column: 35, scope: !134)
!143 = !DILocation(line: 119, column: 28, scope: !134)
!144 = !DILocation(line: 119, column: 40, scope: !134)
!145 = !DILocation(line: 120, column: 9, scope: !134)
!146 = !DILocation(line: 120, column: 21, scope: !134)
!147 = !DILocation(line: 121, column: 20, scope: !134)
!148 = !DILocation(line: 121, column: 9, scope: !134)
!149 = !DILocation(line: 123, column: 1, scope: !116)
