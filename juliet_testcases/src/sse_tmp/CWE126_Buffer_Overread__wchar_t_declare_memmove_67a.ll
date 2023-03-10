; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_declare_memmove_67a.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_declare_memmove_67a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._CWE126_Buffer_Overread__wchar_t_declare_memmove_67_structType = type { i32* }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__wchar_t_declare_memmove_67_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %myStruct = alloca %struct._CWE126_Buffer_Overread__wchar_t_declare_memmove_67_structType, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !15, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata %struct._CWE126_Buffer_Overread__wchar_t_declare_memmove_67_structType* %myStruct, metadata !21, metadata !DIExpression()), !dbg !26
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !27, metadata !DIExpression()), !dbg !31
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !32, metadata !DIExpression()), !dbg !36
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !37
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 49) #4, !dbg !38
  %arrayidx = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 49, !dbg !39
  store i32 0, i32* %arrayidx, align 4, !dbg !40
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !41
  %call2 = call i32* @wmemset(i32* %arraydecay1, i32 65, i64 99) #4, !dbg !42
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 99, !dbg !43
  store i32 0, i32* %arrayidx3, align 4, !dbg !44
  %arraydecay4 = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !45
  store i32* %arraydecay4, i32** %data, align 8, !dbg !46
  %0 = load i32*, i32** %data, align 8, !dbg !47
  %structFirst = getelementptr inbounds %struct._CWE126_Buffer_Overread__wchar_t_declare_memmove_67_structType, %struct._CWE126_Buffer_Overread__wchar_t_declare_memmove_67_structType* %myStruct, i32 0, i32 0, !dbg !48
  store i32* %0, i32** %structFirst, align 8, !dbg !49
  %coerce.dive = getelementptr inbounds %struct._CWE126_Buffer_Overread__wchar_t_declare_memmove_67_structType, %struct._CWE126_Buffer_Overread__wchar_t_declare_memmove_67_structType* %myStruct, i32 0, i32 0, !dbg !50
  %1 = load i32*, i32** %coerce.dive, align 8, !dbg !50
  call void @CWE126_Buffer_Overread__wchar_t_declare_memmove_67b_badSink(i32* %1), !dbg !50
  ret void, !dbg !51
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

declare dso_local void @CWE126_Buffer_Overread__wchar_t_declare_memmove_67b_badSink(i32*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__wchar_t_declare_memmove_67_good() #0 !dbg !52 {
entry:
  call void @goodG2B(), !dbg !53
  ret void, !dbg !54
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !55 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !61, metadata !DIExpression()), !dbg !62
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !63, metadata !DIExpression()), !dbg !64
  %call = call i64 @time(i64* null) #4, !dbg !65
  %conv = trunc i64 %call to i32, !dbg !66
  call void @srand(i32 %conv) #4, !dbg !67
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !68
  call void @CWE126_Buffer_Overread__wchar_t_declare_memmove_67_good(), !dbg !69
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !71
  call void @CWE126_Buffer_Overread__wchar_t_declare_memmove_67_bad(), !dbg !72
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !73
  ret i32 0, !dbg !74
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !75 {
entry:
  %data = alloca i32*, align 8
  %myStruct = alloca %struct._CWE126_Buffer_Overread__wchar_t_declare_memmove_67_structType, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !76, metadata !DIExpression()), !dbg !77
  call void @llvm.dbg.declare(metadata %struct._CWE126_Buffer_Overread__wchar_t_declare_memmove_67_structType* %myStruct, metadata !78, metadata !DIExpression()), !dbg !79
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !80, metadata !DIExpression()), !dbg !81
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !82, metadata !DIExpression()), !dbg !83
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !84
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 49) #4, !dbg !85
  %arrayidx = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 49, !dbg !86
  store i32 0, i32* %arrayidx, align 4, !dbg !87
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !88
  %call2 = call i32* @wmemset(i32* %arraydecay1, i32 65, i64 99) #4, !dbg !89
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 99, !dbg !90
  store i32 0, i32* %arrayidx3, align 4, !dbg !91
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !92
  store i32* %arraydecay4, i32** %data, align 8, !dbg !93
  %0 = load i32*, i32** %data, align 8, !dbg !94
  %structFirst = getelementptr inbounds %struct._CWE126_Buffer_Overread__wchar_t_declare_memmove_67_structType, %struct._CWE126_Buffer_Overread__wchar_t_declare_memmove_67_structType* %myStruct, i32 0, i32 0, !dbg !95
  store i32* %0, i32** %structFirst, align 8, !dbg !96
  %coerce.dive = getelementptr inbounds %struct._CWE126_Buffer_Overread__wchar_t_declare_memmove_67_structType, %struct._CWE126_Buffer_Overread__wchar_t_declare_memmove_67_structType* %myStruct, i32 0, i32 0, !dbg !97
  %1 = load i32*, i32** %coerce.dive, align 8, !dbg !97
  call void @CWE126_Buffer_Overread__wchar_t_declare_memmove_67b_goodG2BSink(i32* %1), !dbg !97
  ret void, !dbg !98
}

declare dso_local void @CWE126_Buffer_Overread__wchar_t_declare_memmove_67b_goodG2BSink(i32*) #3

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_declare_memmove_67a.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_declare_memmove_67_bad", scope: !12, file: !12, line: 31, type: !13, scopeLine: 32, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_declare_memmove_67a.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 33, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !18, line: 74, baseType: !19)
!18 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!19 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!20 = !DILocation(line: 33, column: 15, scope: !11)
!21 = !DILocalVariable(name: "myStruct", scope: !11, file: !12, line: 34, type: !22)
!22 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE126_Buffer_Overread__wchar_t_declare_memmove_67_structType", file: !12, line: 24, baseType: !23)
!23 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_CWE126_Buffer_Overread__wchar_t_declare_memmove_67_structType", file: !12, line: 21, size: 64, elements: !24)
!24 = !{!25}
!25 = !DIDerivedType(tag: DW_TAG_member, name: "structFirst", scope: !23, file: !12, line: 23, baseType: !16, size: 64)
!26 = !DILocation(line: 34, column: 67, scope: !11)
!27 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 35, type: !28)
!28 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 1600, elements: !29)
!29 = !{!30}
!30 = !DISubrange(count: 50)
!31 = !DILocation(line: 35, column: 13, scope: !11)
!32 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 36, type: !33)
!33 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 3200, elements: !34)
!34 = !{!35}
!35 = !DISubrange(count: 100)
!36 = !DILocation(line: 36, column: 13, scope: !11)
!37 = !DILocation(line: 37, column: 13, scope: !11)
!38 = !DILocation(line: 37, column: 5, scope: !11)
!39 = !DILocation(line: 38, column: 5, scope: !11)
!40 = !DILocation(line: 38, column: 25, scope: !11)
!41 = !DILocation(line: 39, column: 13, scope: !11)
!42 = !DILocation(line: 39, column: 5, scope: !11)
!43 = !DILocation(line: 40, column: 5, scope: !11)
!44 = !DILocation(line: 40, column: 27, scope: !11)
!45 = !DILocation(line: 42, column: 12, scope: !11)
!46 = !DILocation(line: 42, column: 10, scope: !11)
!47 = !DILocation(line: 43, column: 28, scope: !11)
!48 = !DILocation(line: 43, column: 14, scope: !11)
!49 = !DILocation(line: 43, column: 26, scope: !11)
!50 = !DILocation(line: 44, column: 5, scope: !11)
!51 = !DILocation(line: 45, column: 1, scope: !11)
!52 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_declare_memmove_67_good", scope: !12, file: !12, line: 70, type: !13, scopeLine: 71, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!53 = !DILocation(line: 72, column: 5, scope: !52)
!54 = !DILocation(line: 73, column: 1, scope: !52)
!55 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 85, type: !56, scopeLine: 86, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!56 = !DISubroutineType(types: !57)
!57 = !{!19, !19, !58}
!58 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !59, size: 64)
!59 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !60, size: 64)
!60 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!61 = !DILocalVariable(name: "argc", arg: 1, scope: !55, file: !12, line: 85, type: !19)
!62 = !DILocation(line: 85, column: 14, scope: !55)
!63 = !DILocalVariable(name: "argv", arg: 2, scope: !55, file: !12, line: 85, type: !58)
!64 = !DILocation(line: 85, column: 27, scope: !55)
!65 = !DILocation(line: 88, column: 22, scope: !55)
!66 = !DILocation(line: 88, column: 12, scope: !55)
!67 = !DILocation(line: 88, column: 5, scope: !55)
!68 = !DILocation(line: 90, column: 5, scope: !55)
!69 = !DILocation(line: 91, column: 5, scope: !55)
!70 = !DILocation(line: 92, column: 5, scope: !55)
!71 = !DILocation(line: 95, column: 5, scope: !55)
!72 = !DILocation(line: 96, column: 5, scope: !55)
!73 = !DILocation(line: 97, column: 5, scope: !55)
!74 = !DILocation(line: 99, column: 5, scope: !55)
!75 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 54, type: !13, scopeLine: 55, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!76 = !DILocalVariable(name: "data", scope: !75, file: !12, line: 56, type: !16)
!77 = !DILocation(line: 56, column: 15, scope: !75)
!78 = !DILocalVariable(name: "myStruct", scope: !75, file: !12, line: 57, type: !22)
!79 = !DILocation(line: 57, column: 67, scope: !75)
!80 = !DILocalVariable(name: "dataBadBuffer", scope: !75, file: !12, line: 58, type: !28)
!81 = !DILocation(line: 58, column: 13, scope: !75)
!82 = !DILocalVariable(name: "dataGoodBuffer", scope: !75, file: !12, line: 59, type: !33)
!83 = !DILocation(line: 59, column: 13, scope: !75)
!84 = !DILocation(line: 60, column: 13, scope: !75)
!85 = !DILocation(line: 60, column: 5, scope: !75)
!86 = !DILocation(line: 61, column: 5, scope: !75)
!87 = !DILocation(line: 61, column: 25, scope: !75)
!88 = !DILocation(line: 62, column: 13, scope: !75)
!89 = !DILocation(line: 62, column: 5, scope: !75)
!90 = !DILocation(line: 63, column: 5, scope: !75)
!91 = !DILocation(line: 63, column: 27, scope: !75)
!92 = !DILocation(line: 65, column: 12, scope: !75)
!93 = !DILocation(line: 65, column: 10, scope: !75)
!94 = !DILocation(line: 66, column: 28, scope: !75)
!95 = !DILocation(line: 66, column: 14, scope: !75)
!96 = !DILocation(line: 66, column: 26, scope: !75)
!97 = !DILocation(line: 67, column: 5, scope: !75)
!98 = !DILocation(line: 68, column: 1, scope: !75)
