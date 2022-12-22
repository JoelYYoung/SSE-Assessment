; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memcpy_16.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memcpy_16.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memcpy_16_bad() #0 !dbg !11 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca [50 x i64], align 16
  %dataGoodBuffer = alloca [100 x i64], align 16
  %source = alloca [100 x i64], align 16
  call void @llvm.dbg.declare(metadata i64** %data, metadata !15, metadata !DIExpression()), !dbg !22
  call void @llvm.dbg.declare(metadata [50 x i64]* %dataBadBuffer, metadata !23, metadata !DIExpression()), !dbg !27
  call void @llvm.dbg.declare(metadata [100 x i64]* %dataGoodBuffer, metadata !28, metadata !DIExpression()), !dbg !32
  br label %while.body, !dbg !33

while.body:                                       ; preds = %entry
  %arraydecay = getelementptr inbounds [50 x i64], [50 x i64]* %dataBadBuffer, i64 0, i64 0, !dbg !34
  store i64* %arraydecay, i64** %data, align 8, !dbg !36
  br label %while.end, !dbg !37

while.end:                                        ; preds = %while.body
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !38, metadata !DIExpression()), !dbg !40
  %0 = bitcast [100 x i64]* %source to i8*, !dbg !40
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 800, i1 false), !dbg !40
  %1 = load i64*, i64** %data, align 8, !dbg !41
  %2 = bitcast i64* %1 to i8*, !dbg !42
  %arraydecay1 = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !42
  %3 = bitcast i64* %arraydecay1 to i8*, !dbg !42
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %2, i8* align 16 %3, i64 800, i1 false), !dbg !42
  %4 = load i64*, i64** %data, align 8, !dbg !43
  %arrayidx = getelementptr inbounds i64, i64* %4, i64 0, !dbg !43
  %5 = load i64, i64* %arrayidx, align 8, !dbg !43
  call void @printLongLongLine(i64 %5), !dbg !44
  ret void, !dbg !45
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

declare dso_local void @printLongLongLine(i64) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memcpy_16_good() #0 !dbg !46 {
entry:
  call void @goodG2B(), !dbg !47
  ret void, !dbg !48
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !49 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !56, metadata !DIExpression()), !dbg !57
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !58, metadata !DIExpression()), !dbg !59
  %call = call i64 @time(i64* null) #6, !dbg !60
  %conv = trunc i64 %call to i32, !dbg !61
  call void @srand(i32 %conv) #6, !dbg !62
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !63
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memcpy_16_good(), !dbg !64
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !65
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !66
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memcpy_16_bad(), !dbg !67
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !68
  ret i32 0, !dbg !69
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !70 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca [50 x i64], align 16
  %dataGoodBuffer = alloca [100 x i64], align 16
  %source = alloca [100 x i64], align 16
  call void @llvm.dbg.declare(metadata i64** %data, metadata !71, metadata !DIExpression()), !dbg !72
  call void @llvm.dbg.declare(metadata [50 x i64]* %dataBadBuffer, metadata !73, metadata !DIExpression()), !dbg !74
  call void @llvm.dbg.declare(metadata [100 x i64]* %dataGoodBuffer, metadata !75, metadata !DIExpression()), !dbg !76
  br label %while.body, !dbg !77

while.body:                                       ; preds = %entry
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %dataGoodBuffer, i64 0, i64 0, !dbg !78
  store i64* %arraydecay, i64** %data, align 8, !dbg !80
  br label %while.end, !dbg !81

while.end:                                        ; preds = %while.body
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !82, metadata !DIExpression()), !dbg !84
  %0 = bitcast [100 x i64]* %source to i8*, !dbg !84
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 800, i1 false), !dbg !84
  %1 = load i64*, i64** %data, align 8, !dbg !85
  %2 = bitcast i64* %1 to i8*, !dbg !86
  %arraydecay1 = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !86
  %3 = bitcast i64* %arraydecay1 to i8*, !dbg !86
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %2, i8* align 16 %3, i64 800, i1 false), !dbg !86
  %4 = load i64*, i64** %data, align 8, !dbg !87
  %arrayidx = getelementptr inbounds i64, i64* %4, i64 0, !dbg !87
  %5 = load i64, i64* %arrayidx, align 8, !dbg !87
  call void @printLongLongLine(i64 %5), !dbg !88
  ret void, !dbg !89
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { argmemonly nofree nounwind willreturn }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memcpy_16.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memcpy_16_bad", scope: !12, file: !12, line: 21, type: !13, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memcpy_16.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 23, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !18, line: 27, baseType: !19)
!18 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "")
!19 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !20, line: 43, baseType: !21)
!20 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!21 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!22 = !DILocation(line: 23, column: 15, scope: !11)
!23 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 24, type: !24)
!24 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 3200, elements: !25)
!25 = !{!26}
!26 = !DISubrange(count: 50)
!27 = !DILocation(line: 24, column: 13, scope: !11)
!28 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 25, type: !29)
!29 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 6400, elements: !30)
!30 = !{!31}
!31 = !DISubrange(count: 100)
!32 = !DILocation(line: 25, column: 13, scope: !11)
!33 = !DILocation(line: 26, column: 5, scope: !11)
!34 = !DILocation(line: 30, column: 16, scope: !35)
!35 = distinct !DILexicalBlock(scope: !11, file: !12, line: 27, column: 5)
!36 = !DILocation(line: 30, column: 14, scope: !35)
!37 = !DILocation(line: 31, column: 9, scope: !35)
!38 = !DILocalVariable(name: "source", scope: !39, file: !12, line: 34, type: !29)
!39 = distinct !DILexicalBlock(scope: !11, file: !12, line: 33, column: 5)
!40 = !DILocation(line: 34, column: 17, scope: !39)
!41 = !DILocation(line: 36, column: 16, scope: !39)
!42 = !DILocation(line: 36, column: 9, scope: !39)
!43 = !DILocation(line: 37, column: 27, scope: !39)
!44 = !DILocation(line: 37, column: 9, scope: !39)
!45 = !DILocation(line: 39, column: 1, scope: !11)
!46 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memcpy_16_good", scope: !12, file: !12, line: 65, type: !13, scopeLine: 66, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!47 = !DILocation(line: 67, column: 5, scope: !46)
!48 = !DILocation(line: 68, column: 1, scope: !46)
!49 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 80, type: !50, scopeLine: 81, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!50 = !DISubroutineType(types: !51)
!51 = !{!52, !52, !53}
!52 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!53 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !54, size: 64)
!54 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !55, size: 64)
!55 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!56 = !DILocalVariable(name: "argc", arg: 1, scope: !49, file: !12, line: 80, type: !52)
!57 = !DILocation(line: 80, column: 14, scope: !49)
!58 = !DILocalVariable(name: "argv", arg: 2, scope: !49, file: !12, line: 80, type: !53)
!59 = !DILocation(line: 80, column: 27, scope: !49)
!60 = !DILocation(line: 83, column: 22, scope: !49)
!61 = !DILocation(line: 83, column: 12, scope: !49)
!62 = !DILocation(line: 83, column: 5, scope: !49)
!63 = !DILocation(line: 85, column: 5, scope: !49)
!64 = !DILocation(line: 86, column: 5, scope: !49)
!65 = !DILocation(line: 87, column: 5, scope: !49)
!66 = !DILocation(line: 90, column: 5, scope: !49)
!67 = !DILocation(line: 91, column: 5, scope: !49)
!68 = !DILocation(line: 92, column: 5, scope: !49)
!69 = !DILocation(line: 94, column: 5, scope: !49)
!70 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 46, type: !13, scopeLine: 47, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!71 = !DILocalVariable(name: "data", scope: !70, file: !12, line: 48, type: !16)
!72 = !DILocation(line: 48, column: 15, scope: !70)
!73 = !DILocalVariable(name: "dataBadBuffer", scope: !70, file: !12, line: 49, type: !24)
!74 = !DILocation(line: 49, column: 13, scope: !70)
!75 = !DILocalVariable(name: "dataGoodBuffer", scope: !70, file: !12, line: 50, type: !29)
!76 = !DILocation(line: 50, column: 13, scope: !70)
!77 = !DILocation(line: 51, column: 5, scope: !70)
!78 = !DILocation(line: 54, column: 16, scope: !79)
!79 = distinct !DILexicalBlock(scope: !70, file: !12, line: 52, column: 5)
!80 = !DILocation(line: 54, column: 14, scope: !79)
!81 = !DILocation(line: 55, column: 9, scope: !79)
!82 = !DILocalVariable(name: "source", scope: !83, file: !12, line: 58, type: !29)
!83 = distinct !DILexicalBlock(scope: !70, file: !12, line: 57, column: 5)
!84 = !DILocation(line: 58, column: 17, scope: !83)
!85 = !DILocation(line: 60, column: 16, scope: !83)
!86 = !DILocation(line: 60, column: 9, scope: !83)
!87 = !DILocation(line: 61, column: 27, scope: !83)
!88 = !DILocation(line: 61, column: 9, scope: !83)
!89 = !DILocation(line: 63, column: 1, scope: !70)
